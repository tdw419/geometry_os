; DESCRIPTION: Composite: Places a purple 85x45 rectangle at position (202, 106) then Sets a single blue pixel at (131, 171).
; PLAN: r0=202(x), r1=106(y), r2=85(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=171(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 202
LDI r1, 106
LDI r2, 85
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 171
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
