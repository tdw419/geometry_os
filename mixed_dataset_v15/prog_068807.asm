; DESCRIPTION: Composite: Creates a blue rectangular region at (460, 6) spanning 16 by 63 pixels then Places a black dot at position (257, 38).
; PLAN: r0=460(x), r1=6(y), r2=16(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=38(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 460
LDI r1, 6
LDI r2, 16
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 38
LDI r7, 0x000000
PSET r5, r6, r7
HALT
