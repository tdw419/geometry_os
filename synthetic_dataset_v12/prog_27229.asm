; DESCRIPTION: Composite: Draws a orange line from (393, 9) to (129, 70) then Draws a black rectangle at (293, 76) with width 15 and height 60.
; PLAN: r0=393(x1), r1=9(y1), r2=129(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=76(y), r7=15(width), r8=60(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 9
LDI r2, 129
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 76
LDI r7, 15
LDI r8, 60
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
