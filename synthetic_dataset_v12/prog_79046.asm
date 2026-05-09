; DESCRIPTION: Composite: Places a orange line segment connecting (117, 100) to (254, 221) then Draws a black rectangle at (386, 6) with width 107 and height 86.
; PLAN: r0=117(x1), r1=100(y1), r2=254(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=6(y), r7=107(width), r8=86(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 100
LDI r2, 254
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 6
LDI r7, 107
LDI r8, 86
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
