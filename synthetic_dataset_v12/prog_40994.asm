; DESCRIPTION: Composite: Draws a orange line from (457, 238) to (93, 2) then Renders a red disk with center (425, 148) and radius 26.
; PLAN: r0=457(x1), r1=238(y1), r2=93(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=148(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 457
LDI r1, 238
LDI r2, 93
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 148
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
