; DESCRIPTION: Composite: Draws a red rectangle at (1, 92) with width 15 and height 29 then Places a orange line segment connecting (509, 31) to (463, 84).
; PLAN: r0=1(x), r1=92(y), r2=15(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=509(x1), r6=31(y1), r7=463(x2), r8=84(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 92
LDI r2, 15
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 31
LDI r7, 463
LDI r8, 84
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
