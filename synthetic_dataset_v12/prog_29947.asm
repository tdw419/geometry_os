; DESCRIPTION: Composite: Sets a single red pixel at (481, 127) then Places a white circle of radius 26 at center (390, 212).
; PLAN: r0=481(x), r1=127(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=390(x), r6=212(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 481
LDI r1, 127
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 390
LDI r6, 212
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
