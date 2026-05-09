; DESCRIPTION: Composite: Places a orange line segment connecting (407, 89) to (52, 163) then Draws a cyan rectangle at (272, 87) with width 99 and height 45.
; PLAN: r0=407(x1), r1=89(y1), r2=52(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=87(y), r7=99(width), r8=45(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 407
LDI r1, 89
LDI r2, 52
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 87
LDI r7, 99
LDI r8, 45
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
