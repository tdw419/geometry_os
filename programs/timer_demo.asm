; timer_demo.asm -- Phase 222: Wall-Clock Timer & Alarm Demo
; Demonstrates TMR_GET, TMR_WAIT, ALARM_SET, ALARM_CLR
;
; Visual output:
;   - Top bar: elapsed milliseconds since start (bar height)
;   - Bottom marker: alarm fire indicator (green pixel at row 20)
;   - Dot row: last hex digit of elapsed ms

; --- Part 1: TMR_GET baseline ---
TMR_GET r1

; --- Part 2: TMR_WAIT 200ms ---
LDI r2, 200
TMR_WAIT r2

; --- Part 3: TMR_GET again, compute delta ---
TMR_GET r3
SUB r4, r3, r1

; --- Part 4: Visualize elapsed time as vertical bar ---
; Bar at x=2, height = min(r4/10, 30), color=4 (blue)
DIV r7, r4, 10
LDI r8, 30
CMP r7, r8
; JGE is not a standard GeoASM jump, using CMP/BLT logic
; CMP r7, r8 sets r0 to result. 
; BLT r0, draw_bar -- if r7 < r8 jump to draw_bar
BLT r0, draw_bar
MOV r7, r8
draw_bar:
LDI r9, 2       ; x
LDI r10, 0      ; y
bar_loop:
CMPI r7, 0
JZ r0, bar_done
PSET r9, r10, r8 ; use r8 for blue color? No, color=4
LDI r15, 0x0000FF
PSET r9, r10, r15
ADDI r10, 1
SUBI r7, 1
JMP bar_loop
bar_done:

; --- Part 5: Set alarm for 100ms, writes 99 to RAM[0xF00] ---
LDI r11, 100    ; delay ms
LDI r12, 0xF00  ; RAM address
LDI r13, 99     ; value to write
ALARM_SET r11, r12, r13

; --- Part 6: Spin until alarm fires ---
alarm_wait:
FRAME
LDI r14, 0xF00
LOAD r14, r14
CMPI r14, 99
JNZ r0, alarm_wait

; --- Part 7: Alarm fired! Mark success ---
LDI r15, 5      ; x
LDI r16, 20     ; y (bottom area)
LDI r17, 0x00FF00
PSET r15, r16, r17 ; green pixel

; --- Part 8: Show last hex digit of elapsed ms as dots ---
ANDI r4, 0xF
MOV r20, r4
LDI r21, 8      ; start x for dots
LDI r22, 20     ; y (same row as alarm marker)
dot_loop:
CMPI r20, 0
JZ r0, dots_done
LDI r17, 0xFF0000
PSET r21, r22, r17 ; bright red dots
ADDI r21, 1
SUBI r20, 1
JMP dot_loop
dots_done:

; --- Part 9: Clear the alarm slot ---
LDI r17, 0
ALARM_CLR r17

FRAME
HALT
