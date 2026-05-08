; DESCRIPTION: Display a object using color colored at the screen.

; timer_demo.asm -- Phase 222: Wall-Clock Timer & Alarm Demo
; Demonstrates TMR_GET, TMR_WAIT, ALARM_SET, ALARM_CLR
;
; Visual output:
;   - Top bar: elapsed milliseconds since start (bar height)
;   - Bottom marker: alarm fire indicator (green pixel at row 20)
;   - Dot row: last hex digit of elapsed ms

; --- Part 1: TMR_GET baseline ---
TMR_GET r0

; --- Part 2: TMR_WAIT 200ms ---
IMM r12, 200
TMR_WAIT r12

; --- Part 3: TMR_GET again, compute delta ---
TMR_GET r10
SUB r14, r10, r0

; --- Part 4: Visualize elapsed time as vertical bar ---
; Bar at x=2, height = min(r14/10, 30), color=4 (blue)
DIV r2, r14, 10
IMM r1, 30
CMP r2, r1
JGE r2, r1, cap_height
JMP draw_bar
cap_height:
MOV r2, r1
draw_bar:
IMM r3, 2       ; x
IMM r7, 0      ; y
bar_loop:
CMP r2, 0
JEQ r2, 0, bar_done
PXL r3, r7, 4
INC r7
DEC r2
JMP bar_loop
bar_done:

; --- Part 5: Set alarm for 100ms, writes 99 to RAM[0xF00] ---
IMM r11, 100    ; delay ms
IMM r8, 0xF00  ; RAM address
IMM r4, 99     ; value to write
ALARM_SET r11, r8, r4

; --- Part 6: Spin until alarm fires ---
alarm_wait:
FRAME
LOAD r5, 0xF00
CMP r5, 99
JNE r5, 99, alarm_wait

; --- Part 7: Alarm fired! Mark success ---
IMM r13, 5      ; x
IMM r16, 20     ; y (bottom area)
PXL r13, r16, 2 ; green pixel

; --- Part 8: Show last hex digit of elapsed ms as dots ---
AND r20, r14, 0xF
IMM r21, 8      ; start x for dots
IMM r22, 20     ; y (same row as alarm marker)
dot_loop:
CMP r20, 0
JEQ r20, 0, dots_done
PXL r21, r22, 12 ; bright red dots
INC r21
DEC r20
JMP dot_loop
dots_done:

; --- Part 9: Clear the alarm slot ---
IMM r17, 0
ALARM_CLR r17

FRAME
HALT
