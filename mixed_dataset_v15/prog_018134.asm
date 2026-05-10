; DESCRIPTION: Composite: Renders a cyan line between points (481, 29) and (77, 160) then Renders a orange box of size 50x118 starting at (432, 87) then Sets a single magenta pixel at (335, 246).
; PLAN: r0=481(x1), r1=29(y1), r2=77(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=87(y), r7=50(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x), r11=246(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 481
LDI r1, 29
LDI r2, 77
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 87
LDI r7, 50
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 246
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
