; DESCRIPTION: Composite: Places a green 62x79 rectangle at position (153, 130) then Sets a single yellow pixel at (257, 57).
; PLAN: r0=153(x), r1=130(y), r2=62(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=57(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 153
LDI r1, 130
LDI r2, 62
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 57
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
