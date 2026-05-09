; DESCRIPTION: Composite: Places a orange line segment connecting (351, 180) to (325, 226) then Renders a red box of size 70x43 starting at (212, 51).
; PLAN: r0=351(x1), r1=180(y1), r2=325(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=212(x), r6=51(y), r7=70(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 180
LDI r2, 325
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 51
LDI r7, 70
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
