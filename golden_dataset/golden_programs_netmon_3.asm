; DESCRIPTION: Render a colored object at the screen.

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
    LDI r0, 1
    LDI r12, 0
    LDI r5, 0             ; total packets
    LDI r7, 0            ; rate counter
    LDI r1, 0            ; displayed rate
    LDI r15, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r9, net_path
    LDI r13, 0
    OPEN r9, r13
    MOV r11, r8            ; r11 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r9, 0x080810
    FILL r9

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r9, 0xFFE
    LOAD r9, r9
    LDI r13, 31
    AND r9, r13
    LDI r13, 15
    CMP r9, r13
    JNZ r8, no_sim
    RAND r9
    LDI r13, 0xFFC
    STORE r13, r9
no_sim:

    ; == READ FROM /dev/net ==
    LDI r9, 0xFFC
    LDI r13, 1
    READ r11, r9, r13
    LDI r9, 0
    CMP r8, r9
    JZ r8, no_pkt

    ; Store packet
    LDI r9, 0xFFC
    LOAD r24, r9           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r9, r15
    LDI r13, 2
    SHL r9, r13
    MOV r13, r22
    ADD r13, r9
    STORE r13, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r9, r0
    ADD r13, r9
    MOV r2, r24
    LDI r6, 24
    SHR r2, r6             ; top byte
    STORE r13, r2

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r9, r0
    ADD r13, r9
    LDI r2, 0xFFE
    LOAD r2, r2
    STORE r13, r2

    ; Advance head
    ADD r15, r0
    LDI r9, 32
    CMP r15, r9
    BLT r8, no_wrap
    LDI r15, 0
no_wrap:
    ADD r5, r0
    ADD r7, r0

no_pkt:
    ; == RATE UPDATE ==
    LDI r9, 0xFFE
    LOAD r14, r9
    LDI r9, 63
    AND r14, r9
    LDI r9, 2
    CMP r14, r9
    BGE r8, no_rate
    MOV r1, r7
    LDI r7, 0
no_rate:

    ; == TITLE BAR ==
    LDI r9, 0
    LDI r13, 0
    LDI r2, 256
    LDI r6, 14
    LDI r3, 0x003366
    RECTF r9, r13, r2, r6, r3

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r9, 0xE003
    LDI r13, 0
    LDI r2, 0
    IOCTL r9, r13, r2
    LDI r9, 0
    CMP r8, r9
    JZ r8, net_down_label

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
    LDI r9, 0
    CMP r5, r9
    JZ r8, show_empty

    ; Determine entry index
    LDI r9, 28
    CMP r5, r9
    BGE r8, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r5
    BLT r8, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r9, r15
    LDI r13, 28
    SUB r9, r13
    ADD r9, r25
    LDI r13, 31
    AND r9, r13

do_draw_entry:
    ; r9 = entry index
    LDI r13, 2
    SHL r9, r13             ; entry * 4
    MOV r2, r22
    ADD r2, r9             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r13, r2
    ADD r13, r0
    LOAD r3, r13           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r6, 0xE0
    AND r3, r6            ; top 3 bits
    LDI r6, 5
    SHR r3, r6            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r6, 0x44
    OR r3, r6             ; ensure minimum brightness

    ; Draw row bar
    LDI r9, 2
    LDI r13, 256
    LDI r6, 7
    RECTF r9, r17, r13, r6, r3

    ; Draw a bright accent line on left
    MOV r9, r2
    LOAD r10, r9           ; data word
    LDI r14, 16
    SHR r10, r14
    LDI r14, 0xF
    AND r10, r14
    LDI r14, 2
    MUL r10, r14
    ADD r10, r0             ; width = 3..33
    LDI r14, 0x00CCFF      ; cyan accent
    RECTF r9, r17, r10, r6, r14

skip_row:
    LDI r9, 8
    ADD r17, r9
    ADD r25, r0
    LDI r9, 28
    CMP r25, r9
    BLT r8, pkt_row
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
    LDI r9, 0
    LDI r13, 242
    LDI r2, 256
    LDI r6, 14
    LDI r3, 0x002244
    RECTF r9, r13, r2, r6, r3

    ; Build "PKT:N" at 0x6000
    LDI r9, 0x6000
    LDI r3, 80            ; 'P'
    STORE r9, r3
    ADD r9, r0
    LDI r3, 75
    STORE r9, r3
    ADD r9, r0
    LDI r3, 84
    STORE r9, r3
    ADD r9, r0
    LDI r3, 58
    STORE r9, r3
    ADD r9, r0
    LDI r3, 32
    STORE r9, r3
    ADD r9, r0

    ; Decimal convert r5
    MOV r13, r5
    LDI r2, 0x6020
    LDI r3, 0
    STORE r2, r3
    ; Special case: if r5 == 0, write '0'
    LDI r3, 0
    CMP r13, r3
    JNZ r8, dec_nonzero
    LDI r3, 48
    SUB r2, r0
    STORE r2, r3
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r13
    DIV r28, r27
    MUL r28, r27
    MOV r29, r13
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r2, r0
    STORE r2, r29
    LDI r28, 10
    DIV r13, r28
    LDI r28, 0
    CMP r13, r28
    JNZ r8, dec_nonzero
dec_copy:
    LDI r9, 0x6005
dec_cp:
    LOAD r13, r2
    LDI r27, 0
    CMP r13, r27
    JZ r8, dec_cp_done
    STORE r9, r13
    ADD r9, r0
    ADD r2, r0
    JMP dec_cp
dec_cp_done:
    LDI r3, 0
    STORE r9, r3

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r9, 0x6030
    LDI r3, 82
    STORE r9, r3
    ADD r9, r0
    LDI r3, 65
    STORE r9, r3
    ADD r9, r0
    LDI r3, 84
    STORE r9, r3
    ADD r9, r0
    LDI r3, 69
    STORE r9, r3
    ADD r9, r0
    LDI r3, 58
    STORE r9, r3
    ADD r9, r0
    LDI r3, 32
    STORE r9, r3
    ADD r9, r0

    ; Decimal convert r1
    MOV r13, r1
    LDI r2, 0x6050
    LDI r3, 0
    STORE r2, r3
    LDI r3, 0
    CMP r13, r3
    JNZ r8, rdec_nonzero
    LDI r3, 48
    SUB r2, r0
    STORE r2, r3
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r13
    DIV r28, r27
    MUL r28, r27
    MOV r29, r13
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r2, r0
    STORE r2, r29
    LDI r28, 10
    DIV r13, r28
    LDI r28, 0
    CMP r13, r28
    JNZ r8, rdec_nonzero
rdec_copy:
    LDI r9, 0x6037
rdec_cp:
    LOAD r13, r2
    LDI r27, 0
    CMP r13, r27
    JZ r8, rdec_done
    STORE r9, r13
    ADD r9, r0
    ADD r2, r0
    JMP rdec_cp
rdec_done:
    LDI r3, 47
    STORE r9, r3
    ADD r9, r0
    LDI r3, 115
    STORE r9, r3
    ADD r9, r0
    LDI r3, 0
    STORE r9, r3

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
