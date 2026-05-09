; DESCRIPTION: Composite: Places a magenta dot at position (347, 196) then Renders a purple disk with center (183, 212) and radius 24.
; PLAN: r0=347(x), r1=196(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=212(y), r7=24(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 347
LDI r1, 196
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 183
LDI r6, 212
LDI r7, 24
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
