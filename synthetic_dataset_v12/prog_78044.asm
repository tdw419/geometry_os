; DESCRIPTION: Composite: Places a cyan 31x45 rectangle at position (456, 158) then Sets a single red pixel at (426, 223).
; PLAN: r0=456(x), r1=158(y), r2=31(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x), r6=223(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 456
LDI r1, 158
LDI r2, 31
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 223
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
