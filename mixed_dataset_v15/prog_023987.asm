; DESCRIPTION: Composite: Draws a orange rectangle at (65, 3) with width 96 and height 26 then Renders a magenta line between points (207, 32) and (476, 166) then Sets a single blue pixel at (463, 160).
; PLAN: r0=65(x), r1=3(y), r2=96(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=32(y1), r7=476(x2), r8=166(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=463(x), r11=160(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 65
LDI r1, 3
LDI r2, 96
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 32
LDI r7, 476
LDI r8, 166
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 160
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
