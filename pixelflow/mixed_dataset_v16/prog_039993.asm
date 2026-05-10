; DESCRIPTION: Composite: Places a red dot at position (471, 61) then Draws a red circle centered at (443, 85) with radius 19.
; PLAN: r0=471(x), r1=61(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=443(x), r6=85(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 471
LDI r1, 61
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 443
LDI r6, 85
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
