; DESCRIPTION: Composite: Draws a white rectangle at (2, 162) with width 45 and height 27 then Places a orange line segment connecting (414, 82) to (156, 222).
; PLAN: r0=2(x), r1=162(y), r2=45(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x1), r6=82(y1), r7=156(x2), r8=222(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 162
LDI r2, 45
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 82
LDI r7, 156
LDI r8, 222
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
