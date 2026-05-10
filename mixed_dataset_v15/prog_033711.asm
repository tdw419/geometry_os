; DESCRIPTION: Composite: Places a purple dot at position (372, 200) then Renders a orange line between points (71, 203) and (12, 184).
; PLAN: r0=372(x), r1=200(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=71(x1), r6=203(y1), r7=12(x2), r8=184(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 200
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 71
LDI r6, 203
LDI r7, 12
LDI r8, 184
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
