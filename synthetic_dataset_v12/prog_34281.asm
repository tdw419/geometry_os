; DESCRIPTION: Composite: Places a orange line segment connecting (485, 240) to (98, 76) then Renders a yellow box of size 97x56 starting at (26, 71).
; PLAN: r0=485(x1), r1=240(y1), r2=98(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=71(y), r7=97(width), r8=56(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 485
LDI r1, 240
LDI r2, 98
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 71
LDI r7, 97
LDI r8, 56
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
