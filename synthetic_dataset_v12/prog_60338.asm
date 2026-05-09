; DESCRIPTION: Composite: Places a black circle of radius 58 at center (120, 113) then Sets a single red pixel at (365, 150).
; PLAN: r0=120(x), r1=113(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=365(x), r6=150(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 113
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 365
LDI r6, 150
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
