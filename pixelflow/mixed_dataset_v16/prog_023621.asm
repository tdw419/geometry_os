; DESCRIPTION: Composite: Renders a orange line between points (78, 33) and (30, 128) then Draws a cyan rectangle at (83, 141) with width 52 and height 89.
; PLAN: r0=78(x1), r1=33(y1), r2=30(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=141(y), r7=52(width), r8=89(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 33
LDI r2, 30
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 141
LDI r7, 52
LDI r8, 89
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
