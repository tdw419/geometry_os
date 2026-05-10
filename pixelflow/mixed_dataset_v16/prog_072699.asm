; DESCRIPTION: Composite: Places a orange line segment connecting (304, 228) to (89, 109) then Creates a yellow circular shape at (141, 194) with radius 38.
; PLAN: r0=304(x1), r1=228(y1), r2=89(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=194(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 304
LDI r1, 228
LDI r2, 89
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 194
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
