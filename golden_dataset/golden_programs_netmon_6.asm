; DESCRIPTION: Display a object using color colored at the screen.

; netmon.asm -- Phase 141: Network Packet Viewer
;
; Visual network packet monitor. Reads from /dev/net device,
; displays scrolling packet log with hex data and rate stats.
; Simulates traffic by writing random data to the net port.
;
; Layout:
;   Row 0-1: Title bar
;   Row 2-29: Scrolling packet log (colored bars per packet)
;   Row 30-31: Status bar with packet count and rate
;
; Opcodes: LDI, MOV, ADD, SUB, MUL, DIV, AND, OR, SHL, SHR, SAR
;          MOD, CMP, JZ, JNZ, BLT, BGE, JMP, FILL, RECTF, PSET
;          DRAWTEXT, TEXT, IKEY, RAND, FRAME, OPEN, READ, IOCTL
;          STORE, LOAD

; == INIT ==
    LDI r8, 1
    LDI r10, 0
    LDI r2, 0             ; total packets
    LDI r15, 0            ; rate counter
    LDI r14, 0            ; displayed rate
    LDI r6, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r5, net_path
    LDI r7, 0
    OPEN r5, r7
    MOV r4, r13            ; r4 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r5, 0x080810
    FILL r5

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r5, 0xFFE
    LOAD r5, r5
    LDI r7, 31
    AND r5, r7
    LDI r7, 15
    CMP r5, r7
    JNZ r13, no_sim
    RAND r5
    LDI r7, 0xFFC
    STORE r7, r5
no_sim:

    ; == READ FROM /dev/net ==
    LDI r5, 0xFFC
    LDI r7, 1
    READ r4, r5, r7
    LDI r5, 0
    CMP r13, r5
    JZ r13, no_pkt

    ; Store packet
    LDI r5, 0xFFC
    LOAD r24, r5           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r5, r6
    LDI r7, 2
    SHL r5, r7
    MOV r7, r22
    ADD r7, r5
    STORE r7, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r5, r8
    ADD r7, r5
    MOV r12, r24
    LDI r3, 24
    SHR r12, r3             ; top byte
    STORE r7, r12

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r5, r8
    ADD r7, r5
    LDI r12, 0xFFE
    LOAD r12, r12
    STORE r7, r12

    ; Advance head
    ADD r6, r8
    LDI r5, 32
    CMP r6, r5
    BLT r13, no_wrap
    LDI r6, 0
no_wrap:
    ADD r2, r8
    ADD r15, r8

no_pkt:
    ; == RATE UPDATE ==
    LDI r5, 0xFFE
    LOAD r1, r5
    LDI r5, 63
    AND r1, r5
    LDI r5, 2
    CMP r1, r5
    BGE r13, no_rate
    MOV r14, r15
    LDI r15, 0
no_rate:

    ; == TITLE BAR ==
    LDI r5, 0
    LDI r7, 0
    LDI r12, 256
    LDI r3, 14
    LDI r0, 0x003366
    RECTF r5, r7, r12, r3, r0

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r5, 0xE003
    LDI r7, 0
    LDI r12, 0
    IOCTL r5, r7, r12
    LDI r5, 0
    CMP r13, r5
    JZ r13, net_down_label

    ; Net status indicator
    LDI r16, 90
    LDI r17, 3
    LDI r18, up_str
    LDI r19, 0x00FF00
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20
    JMP pkt_draw

net_down_label:
    LDI r16, 90
    LDI r17, 3
    LDI r18, down_str
    LDI r19, 0xFF0000
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

pkt_draw:
    ; == DRAW PACKET LOG ==
    ; Show last 28 packets as colored bars
    LDI r25, 0             ; display row (0-27)
    LDI r17, 16            ; start y

pkt_row:
    LDI r5, 0
    CMP r2, r5
    JZ r13, show_empty

    ; Determine entry index
    LDI r5, 28
    CMP r2, r5
    BGE r13, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r2
    BLT r13, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r5, r6
    LDI r7, 28
    SUB r5, r7
    ADD r5, r25
    LDI r7, 31
    AND r5, r7

do_draw_entry:
    ; r5 = entry index
    LDI r7, 2
    SHL r5, r7             ; entry * 4
    MOV r12, r22
    ADD r12, r5             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r7, r12
    ADD r7, r8
    LOAD r0, r7           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r3, 0xE0
    AND r0, r3            ; top 3 bits
    LDI r3, 5
    SHR r0, r3            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r3, 0x44
    OR r0, r3             ; ensure minimum brightness

    ; Draw row bar
    LDI r5, 2
    LDI r7, 256
    LDI r3, 7
    RECTF r5, r17, r7, r3, r0

    ; Draw a bright accent line on left
    MOV r5, r12
    LOAD r9, r5           ; data word
    LDI r1, 16
    SHR r9, r1
    LDI r1, 0xF
    AND r9, r1
    LDI r1, 2
    MUL r9, r1
    ADD r9, r8             ; width = 3..33
    LDI r1, 0x00CCFF      ; cyan accent
    RECTF r5, r17, r9, r3, r1

skip_row:
    LDI r5, 8
    ADD r17, r5
    ADD r25, r8
    LDI r5, 28
    CMP r25, r5
    BLT r13, pkt_row
    JMP draw_stat

show_empty:
    LDI r16, 80
    LDI r17, 130
    LDI r18, empty_str
    LDI r19, 0x555555
    LDI r20, 0
    DRAWTEXT r16, r17, r18, r19, r20

draw_stat:
    ; == STATUS BAR ==
    LDI r5, 0
    LDI r7, 242
    LDI r12, 256
    LDI r3, 14
    LDI r0, 0x002244
    RECTF r5, r7, r12, r3, r0

    ; Build "PKT:N" at 0x6000
    LDI r5, 0x6000
    LDI r0, 80            ; 'P'
    STORE r5, r0
    ADD r5, r8
    LDI r0, 75
    STORE r5, r0
    ADD r5, r8
    LDI r0, 84
    STORE r5, r0
    ADD r5, r8
    LDI r0, 58
    STORE r5, r0
    ADD r5, r8
    LDI r0, 32
    STORE r5, r0
    ADD r5, r8

    ; Decimal convert r2
    MOV r7, r2
    LDI r12, 0x6020
    LDI r0, 0
    STORE r12, r0
    ; Special case: if r2 == 0, write '0'
    LDI r0, 0
    CMP r7, r0
    JNZ r13, dec_nonzero
    LDI r0, 48
    SUB r12, r8
    STORE r12, r0
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r7
    DIV r28, r27
    MUL r28, r27
    MOV r29, r7
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r12, r8
    STORE r12, r29
    LDI r28, 10
    DIV r7, r28
    LDI r28, 0
    CMP r7, r28
    JNZ r13, dec_nonzero
dec_copy:
    LDI r5, 0x6005
dec_cp:
    LOAD r7, r12
    LDI r27, 0
    CMP r7, r27
    JZ r13, dec_cp_done
    STORE r5, r7
    ADD r5, r8
    ADD r12, r8
    JMP dec_cp
dec_cp_done:
    LDI r0, 0
    STORE r5, r0

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r5, 0x6030
    LDI r0, 82
    STORE r5, r0
    ADD r5, r8
    LDI r0, 65
    STORE r5, r0
    ADD r5, r8
    LDI r0, 84
    STORE r5, r0
    ADD r5, r8
    LDI r0, 69
    STORE r5, r0
    ADD r5, r8
    LDI r0, 58
    STORE r5, r0
    ADD r5, r8
    LDI r0, 32
    STORE r5, r0
    ADD r5, r8

    ; Decimal convert r14
    MOV r7, r14
    LDI r12, 0x6050
    LDI r0, 0
    STORE r12, r0
    LDI r0, 0
    CMP r7, r0
    JNZ r13, rdec_nonzero
    LDI r0, 48
    SUB r12, r8
    STORE r12, r0
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r7
    DIV r28, r27
    MUL r28, r27
    MOV r29, r7
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r12, r8
    STORE r12, r29
    LDI r28, 10
    DIV r7, r28
    LDI r28, 0
    CMP r7, r28
    JNZ r13, rdec_nonzero
rdec_copy:
    LDI r5, 0x6037
rdec_cp:
    LOAD r7, r12
    LDI r27, 0
    CMP r7, r27
    JZ r13, rdec_done
    STORE r5, r7
    ADD r5, r8
    ADD r12, r8
    JMP rdec_cp
rdec_done:
    LDI r0, 47
    STORE r5, r0
    ADD r5, r8
    LDI r0, 115
    STORE r5, r0
    ADD r5, r8
    LDI r0, 0
    STORE r5, r0

    LDI r16, 130
    LDI r17, 244
    LDI r18, 0x6030
    LDI r19, 0xFFFF00
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    FRAME
    JMP main_loop

; == DATA ==
.org 0x4000
net_path:
    .asciz "/dev/net"
    .db 0

title_str:
    .asciz "NETMON - Packet Viewer"
    .db 0

up_str:
    .asciz "UP"
    .db 0

down_str:
    .asciz "DOWN"
    .db 0

empty_str:
    .asciz "NO PACKETS YET"
    .db 0
