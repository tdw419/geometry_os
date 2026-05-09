; DESCRIPTION: Composite: Draws a orange circle centered at (240, 139) with radius 26 then Places a orange line segment connecting (205, 209) to (136, 246).
; PLAN: r0=240(x), r1=139(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x1), r6=209(y1), r7=136(x2), r8=246(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 139
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 209
LDI r7, 136
LDI r8, 246
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
