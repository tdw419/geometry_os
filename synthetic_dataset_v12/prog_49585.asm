; DESCRIPTION: Composite: Renders a orange line between points (49, 58) and (149, 212) then Creates a red circular shape at (263, 114) with radius 61.
; PLAN: r0=49(x1), r1=58(y1), r2=149(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=114(y), r7=61(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 58
LDI r2, 149
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 114
LDI r7, 61
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
