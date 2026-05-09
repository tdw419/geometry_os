; DESCRIPTION: Composite: Places a red dot at position (404, 158) then Places a red circle of radius 41 at center (418, 124).
; PLAN: r0=404(x), r1=158(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=124(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 404
LDI r1, 158
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 418
LDI r6, 124
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
