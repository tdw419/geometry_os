; DESCRIPTION: Composite: Places a magenta dot at position (329, 254) then Draws a blue rectangle at (270, 86) with width 63 and height 112 then Places a purple line segment connecting (323, 56) to (175, 150).
; PLAN: r0=329(x), r1=254(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=270(x), r6=86(y), r7=63(width), r8=112(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=323(x1), r11=56(y1), r12=175(x2), r13=150(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 254
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 270
LDI r6, 86
LDI r7, 63
LDI r8, 112
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 56
LDI r12, 175
LDI r13, 150
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
