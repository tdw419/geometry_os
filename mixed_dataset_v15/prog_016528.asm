; DESCRIPTION: Composite: Draws a orange line from (195, 125) to (367, 247) then Renders a purple box of size 94x101 starting at (297, 22) then Renders a yellow disk with center (198, 36) and radius 22.
; PLAN: r0=195(x1), r1=125(y1), r2=367(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=22(y), r7=94(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=198(x), r11=36(y), r12=22(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 195
LDI r1, 125
LDI r2, 367
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 22
LDI r7, 94
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 36
LDI r12, 22
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
