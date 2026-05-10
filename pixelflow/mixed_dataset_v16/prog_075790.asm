; DESCRIPTION: Composite: Places a white line segment connecting (478, 2) to (53, 228) then Places a yellow dot at position (82, 11).
; PLAN: r0=478(x1), r1=2(y1), r2=53(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=11(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 478
LDI r1, 2
LDI r2, 53
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 11
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
