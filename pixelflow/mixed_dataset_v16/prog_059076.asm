; DESCRIPTION: Composite: Renders a black box of size 110x56 starting at (295, 136) then Places a red line segment connecting (348, 81) to (302, 179) then Sets a single yellow pixel at (469, 40).
; PLAN: r0=295(x), r1=136(y), r2=110(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x1), r6=81(y1), r7=302(x2), r8=179(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=469(x), r11=40(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 295
LDI r1, 136
LDI r2, 110
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 81
LDI r7, 302
LDI r8, 179
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 40
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
