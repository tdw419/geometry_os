; DESCRIPTION: Composite: Draws a white rectangle at (45, 125) with width 86 and height 27 then Draws a orange line from (20, 162) to (199, 129).
; PLAN: r0=45(x), r1=125(y), r2=86(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x1), r6=162(y1), r7=199(x2), r8=129(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 125
LDI r2, 86
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 162
LDI r7, 199
LDI r8, 129
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
