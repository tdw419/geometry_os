; DESCRIPTION: Composite: Places a orange dot at position (510, 51) then Places a red circle of radius 26 at center (441, 195).
; PLAN: r0=510(x), r1=51(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=195(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 510
LDI r1, 51
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 441
LDI r6, 195
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
