; DESCRIPTION: Composite: Places a magenta 15x71 rectangle at position (371, 31) then Sets a single magenta pixel at (12, 181).
; PLAN: r0=371(x), r1=31(y), r2=15(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x), r6=181(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 371
LDI r1, 31
LDI r2, 15
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 181
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
