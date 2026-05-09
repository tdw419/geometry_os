; DESCRIPTION: Composite: Places a cyan 77x118 rectangle at position (178, 69) then Places a purple dot at position (395, 195).
; PLAN: r0=178(x), r1=69(y), r2=77(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x), r6=195(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 69
LDI r2, 77
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 195
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
