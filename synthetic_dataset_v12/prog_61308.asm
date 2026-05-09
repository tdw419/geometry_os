; DESCRIPTION: Composite: Places a blue dot at position (116, 21) then Places a purple 89x56 rectangle at position (257, 119).
; PLAN: r0=116(x), r1=21(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=119(y), r7=89(width), r8=56(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 21
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 257
LDI r6, 119
LDI r7, 89
LDI r8, 56
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
