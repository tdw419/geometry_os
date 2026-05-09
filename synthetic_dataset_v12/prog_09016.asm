; DESCRIPTION: Composite: Places a magenta 93x106 rectangle at position (32, 136) then Sets a single purple pixel at (481, 76).
; PLAN: r0=32(x), r1=136(y), r2=93(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x), r6=76(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 32
LDI r1, 136
LDI r2, 93
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 76
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
