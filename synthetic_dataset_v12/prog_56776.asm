; DESCRIPTION: Composite: Draws a black rectangle at (0, 19) with width 85 and height 88 then Sets a single magenta pixel at (431, 89) then Renders a cyan line between points (80, 95) and (469, 157).
; PLAN: r0=0(x), r1=19(y), r2=85(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=89(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=80(x1), r11=95(y1), r12=469(x2), r13=157(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 0
LDI r1, 19
LDI r2, 85
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 89
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 80
LDI r11, 95
LDI r12, 469
LDI r13, 157
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
