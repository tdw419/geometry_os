; DESCRIPTION: Composite: Renders a black line between points (189, 157) and (452, 12) then Renders a white box of size 101x71 starting at (133, 150) then Sets a single cyan pixel at (390, 85).
; PLAN: r0=189(x1), r1=157(y1), r2=452(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=150(y), r7=101(width), r8=71(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=390(x), r11=85(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 189
LDI r1, 157
LDI r2, 452
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 150
LDI r7, 101
LDI r8, 71
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 85
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
