; DESCRIPTION: Composite: Renders a white line between points (155, 148) and (509, 86) then Places a orange dot at position (477, 104).
; PLAN: r0=155(x1), r1=148(y1), r2=509(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=477(x), r6=104(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 148
LDI r2, 509
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 104
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
