; DESCRIPTION: Composite: Renders a orange line between points (191, 36) and (0, 238) then Places a red circle of radius 44 at center (458, 109).
; PLAN: r0=191(x1), r1=36(y1), r2=0(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=109(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 191
LDI r1, 36
LDI r2, 0
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 109
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
