; DESCRIPTION: Composite: Places a green dot at position (345, 90) then Draws a blue rectangle at (213, 66) with width 27 and height 110 then Draws a yellow line from (390, 178) to (103, 44).
; PLAN: r0=345(x), r1=90(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=213(x), r6=66(y), r7=27(width), r8=110(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=390(x1), r11=178(y1), r12=103(x2), r13=44(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 90
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 213
LDI r6, 66
LDI r7, 27
LDI r8, 110
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 178
LDI r12, 103
LDI r13, 44
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
