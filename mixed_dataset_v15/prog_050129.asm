; DESCRIPTION: Composite: Places a red dot at position (138, 96) then Creates a blue circular shape at (257, 120) with radius 37.
; PLAN: r0=138(x), r1=96(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=120(y), r7=37(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 96
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 257
LDI r6, 120
LDI r7, 37
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
