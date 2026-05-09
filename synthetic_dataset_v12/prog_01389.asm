; DESCRIPTION: Composite: Places a cyan 84x16 rectangle at position (291, 131) then Sets a single cyan pixel at (238, 119).
; PLAN: r0=291(x), r1=131(y), r2=84(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=119(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 291
LDI r1, 131
LDI r2, 84
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 119
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
