; DESCRIPTION: Composite: Places a red line segment connecting (426, 61) to (10, 73) then Creates a orange circular shape at (280, 76) with radius 66.
; PLAN: r0=426(x1), r1=61(y1), r2=10(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=76(y), r7=66(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 426
LDI r1, 61
LDI r2, 10
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 76
LDI r7, 66
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
