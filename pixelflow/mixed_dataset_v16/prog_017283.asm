; DESCRIPTION: Composite: Places a yellow 13x104 rectangle at position (28, 112) then Sets a single blue pixel at (257, 85).
; PLAN: r0=28(x), r1=112(y), r2=13(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=85(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 28
LDI r1, 112
LDI r2, 13
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 85
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
