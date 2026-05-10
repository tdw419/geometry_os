; DESCRIPTION: Composite: Draws a purple rectangle at (427, 85) with width 51 and height 48 then Renders a orange line between points (442, 249) and (134, 231).
; PLAN: r0=427(x), r1=85(y), r2=51(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x1), r6=249(y1), r7=134(x2), r8=231(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 85
LDI r2, 51
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 249
LDI r7, 134
LDI r8, 231
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
