; DESCRIPTION: Composite: Renders a purple line between points (27, 88) and (69, 163) then Renders a cyan box of size 88x87 starting at (2, 33) then Renders a black disk with center (327, 83) and radius 73.
; PLAN: r0=27(x1), r1=88(y1), r2=69(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=2(x), r6=33(y), r7=88(width), r8=87(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=327(x), r11=83(y), r12=73(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 27
LDI r1, 88
LDI r2, 69
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 33
LDI r7, 88
LDI r8, 87
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 83
LDI r12, 73
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
