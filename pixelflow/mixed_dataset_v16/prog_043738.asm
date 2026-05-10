; DESCRIPTION: Composite: Renders a magenta box of size 89x48 starting at (183, 138) then Renders a red line between points (116, 220) and (149, 55) then Sets a single black pixel at (402, 227).
; PLAN: r0=183(x), r1=138(y), r2=89(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x1), r6=220(y1), r7=149(x2), r8=55(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=402(x), r11=227(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 183
LDI r1, 138
LDI r2, 89
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 220
LDI r7, 149
LDI r8, 55
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 227
LDI r12, 0x000000
PSET r10, r11, r12
HALT
