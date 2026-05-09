; DESCRIPTION: Composite: Draws a orange line from (369, 125) to (60, 14) then Draws a black rectangle at (397, 89) with width 26 and height 10.
; PLAN: r0=369(x1), r1=125(y1), r2=60(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=89(y), r7=26(width), r8=10(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 125
LDI r2, 60
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 89
LDI r7, 26
LDI r8, 10
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
