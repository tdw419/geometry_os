; DESCRIPTION: Composite: Draws a orange circle centered at (165, 109) with radius 21 then Places a orange line segment connecting (301, 173) to (481, 102).
; PLAN: r0=165(x), r1=109(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x1), r6=173(y1), r7=481(x2), r8=102(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 109
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 173
LDI r7, 481
LDI r8, 102
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
