; DESCRIPTION: Composite: Draws a orange line from (424, 74) to (336, 100) then Draws a white rectangle at (220, 47) with width 114 and height 89 then Sets a single yellow pixel at (120, 157).
; PLAN: r0=424(x1), r1=74(y1), r2=336(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=47(y), r7=114(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=120(x), r11=157(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 74
LDI r2, 336
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 47
LDI r7, 114
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 157
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
