; DESCRIPTION: Composite: Renders a yellow line between points (155, 73) and (432, 243) then Renders a red box of size 80x75 starting at (169, 116) then Sets a single black pixel at (96, 200).
; PLAN: r0=155(x1), r1=73(y1), r2=432(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=116(y), r7=80(width), r8=75(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=96(x), r11=200(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 73
LDI r2, 432
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 116
LDI r7, 80
LDI r8, 75
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 200
LDI r12, 0x000000
PSET r10, r11, r12
HALT
