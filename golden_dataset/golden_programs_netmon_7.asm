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
    LDI r12, 1
    LDI r7, 0
    LDI r3, 0             ; total packets
    LDI r4, 0            ; rate counter
    LDI r2, 0            ; displayed rate
    LDI r14, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r5, net_path
    LDI r11, 0
    OPEN r5, r11
    MOV r13, r8            ; r13 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r5, 0x080810
    FILL r5

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r5, 0xFFE
    LOAD r5, r5
    LDI r11, 31
    AND r5, r11
    LDI r11, 15
    CMP r5, r11
    JNZ r8, no_sim
    RAND r5
    LDI r11, 0xFFC
    STORE r11, r5
no_sim:

    ; == READ FROM /dev/net ==
    LDI r5, 0xFFC
    LDI r11, 1
    READ r13, r5, r11
    LDI r5, 0
    CMP r8, r5
    JZ r8, no_pkt

    ; Store packet
    LDI r5, 0xFFC
    LOAD r24, r5           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r5, r14
    LDI r11, 2
    SHL r5, r11
    MOV r11, r22
    ADD r11, r5
    STORE r11, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r5, r12
    ADD r11, r5
    MOV r9, r24
    LDI r0, 24
    SHR r9, r0             ; top byte
    STORE r11, r9

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r5, r12
    ADD r11, r5
    LDI r9, 0xFFE
    LOAD r9, r9
    STORE r11, r9

    ; Advance head
    ADD r14, r12
    LDI r5, 32
    CMP r14, r5
    BLT r8, no_wrap
    LDI r14, 0
no_wrap:
    ADD r3, r12
    ADD r4, r12

no_pkt:
    ; == RATE UPDATE ==
    LDI r5, 0xFFE
    LOAD r15, r5
    LDI r5, 63
    AND r15, r5
    LDI r5, 2
    CMP r15, r5
    BGE r8, no_rate
    MOV r2, r4
    LDI r4, 0
no_rate:

    ; == TITLE BAR ==
    LDI r5, 0
    LDI r11, 0
    LDI r9, 256
    LDI r0, 14
    LDI r6, 0x003366
    RECTF r5, r11, r9, r0, r6

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r5, 0xE003
    LDI r11, 0
    LDI r9, 0
    IOCTL r5, r11, r9
    LDI r5, 0
    CMP r8, r5
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
    LDI r5, 0
    CMP r3, r5
    JZ r8, show_empty

    ; Determine entry index
    LDI r5, 28
    CMP r3, r5
    BGE r8, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r3
    BLT r8, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r5, r14
    LDI r11, 28
    SUB r5, r11
    ADD r5, r25
    LDI r11, 31
    AND r5, r11

do_draw_entry:
    ; r5 = entry index
    LDI r11, 2
    SHL r5, r11             ; entry * 4
    MOV r9, r22
    ADD r9, r5             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r11, r9
    ADD r11, r12
    LOAD r6, r11           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r0, 0xE0
    AND r6, r0            ; top 3 bits
    LDI r0, 5
    SHR r6, r0            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r0, 0x44
    OR r6, r0             ; ensure minimum brightness

    ; Draw row bar
    LDI r5, 2
    LDI r11, 256
    LDI r0, 7
    RECTF r5, r17, r11, r0, r6

    ; Draw a bright accent line on left
    MOV r5, r9
    LOAD r10, r5           ; data word
    LDI r15, 16
    SHR r10, r15
    LDI r15, 0xF
    AND r10, r15
    LDI r15, 2
    MUL r10, r15
    ADD r10, r12             ; width = 3..33
    LDI r15, 0x00CCFF      ; cyan accent
    RECTF r5, r17, r10, r0, r15

skip_row:
    LDI r5, 8
    ADD r17, r5
    ADD r25, r12
    LDI r5, 28
    CMP r25, r5
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
    LDI r5, 0
    LDI r11, 242
    LDI r9, 256
    LDI r0, 14
    LDI r6, 0x002244
    RECTF r5, r11, r9, r0, r6

    ; Build "PKT:N" at 0x6000
    LDI r5, 0x6000
    LDI r6, 80            ; 'P'
    STORE r5, r6
    ADD r5, r12
    LDI r6, 75
    STORE r5, r6
    ADD r5, r12
    LDI r6, 84
    STORE r5, r6
    ADD r5, r12
    LDI r6, 58
    STORE r5, r6
    ADD r5, r12
    LDI r6, 32
    STORE r5, r6
    ADD r5, r12

    ; Decimal convert r3
    MOV r11, r3
    LDI r9, 0x6020
    LDI r6, 0
    STORE r9, r6
    ; Special case: if r3 == 0, write '0'
    LDI r6, 0
    CMP r11, r6
    JNZ r8, dec_nonzero
    LDI r6, 48
    SUB r9, r12
    STORE r9, r6
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r11
    DIV r28, r27
    MUL r28, r27
    MOV r29, r11
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r9, r12
    STORE r9, r29
    LDI r28, 10
    DIV r11, r28
    LDI r28, 0
    CMP r11, r28
    JNZ r8, dec_nonzero
dec_copy:
    LDI r5, 0x6005
dec_cp:
    LOAD r11, r9
    LDI r27, 0
    CMP r11, r27
    JZ r8, dec_cp_done
    STORE r5, r11
    ADD r5, r12
    ADD r9, r12
    JMP dec_cp
dec_cp_done:
    LDI r6, 0
    STORE r5, r6

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r5, 0x6030
    LDI r6, 82
    STORE r5, r6
    ADD r5, r12
    LDI r6, 65
    STORE r5, r6
    ADD r5, r12
    LDI r6, 84
    STORE r5, r6
    ADD r5, r12
    LDI r6, 69
    STORE r5, r6
    ADD r5, r12
    LDI r6, 58
    STORE r5, r6
    ADD r5, r12
    LDI r6, 32
    STORE r5, r6
    ADD r5, r12

    ; Decimal convert r2
    MOV r11, r2
    LDI r9, 0x6050
    LDI r6, 0
    STORE r9, r6
    LDI r6, 0
    CMP r11, r6
    JNZ r8, rdec_nonzero
    LDI r6, 48
    SUB r9, r12
    STORE r9, r6
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r11
    DIV r28, r27
    MUL r28, r27
    MOV r29, r11
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r9, r12
    STORE r9, r29
    LDI r28, 10
    DIV r11, r28
    LDI r28, 0
    CMP r11, r28
    JNZ r8, rdec_nonzero
rdec_copy:
    LDI r5, 0x6037
rdec_cp:
    LOAD r11, r9
    LDI r27, 0
    CMP r11, r27
    JZ r8, rdec_done
    STORE r5, r11
    ADD r5, r12
    ADD r9, r12
    JMP rdec_cp
rdec_done:
    LDI r6, 47
    STORE r5, r6
    ADD r5, r12
    LDI r6, 115
    STORE r5, r6
    ADD r5, r12
    LDI r6, 0
    STORE r5, r6

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
