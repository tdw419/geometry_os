; DESCRIPTION: Composite: Creates a green circular shape at (460, 120) with radius 51 then Sets a single green pixel at (356, 197).
; PLAN: r0=460(x), r1=120(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=197(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 460
LDI r1, 120
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 197
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
