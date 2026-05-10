; DESCRIPTION: Composite: Places a green 45x74 rectangle at position (24, 76) then Sets a single yellow pixel at (455, 39).
; PLAN: r0=24(x), r1=76(y), r2=45(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x), r6=39(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 24
LDI r1, 76
LDI r2, 45
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 39
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
