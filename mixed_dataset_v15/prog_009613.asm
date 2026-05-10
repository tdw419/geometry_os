; DESCRIPTION: Composite: Places a black 94x70 rectangle at position (300, 66) then Sets a single red pixel at (257, 14).
; PLAN: r0=300(x), r1=66(y), r2=94(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=14(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 300
LDI r1, 66
LDI r2, 94
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 14
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
