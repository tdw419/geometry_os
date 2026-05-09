; DESCRIPTION: Composite: Places a cyan line segment connecting (288, 82) to (97, 25) then Places a black circle of radius 19 at center (448, 106) then Draws a red rectangle at (340, 177) with width 20 and height 79.
; PLAN: r0=288(x1), r1=82(y1), r2=97(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=106(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=340(x), r11=177(y), r12=20(width), r13=79(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 82
LDI r2, 97
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 106
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 340
LDI r11, 177
LDI r12, 20
LDI r13, 79
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
