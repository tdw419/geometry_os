; DESCRIPTION: Composite: Renders a blue box of size 106x60 starting at (324, 156) then Creates a white circular shape at (448, 90) with radius 58 then Draws a black line from (270, 253) to (126, 6).
; PLAN: r0=324(x), r1=156(y), r2=106(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x), r6=90(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=270(x1), r11=253(y1), r12=126(x2), r13=6(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 156
LDI r2, 106
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 90
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 270
LDI r11, 253
LDI r12, 126
LDI r13, 6
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
