; DESCRIPTION: Composite: Sets a single purple pixel at (449, 88) then Places a cyan 83x76 rectangle at position (175, 11).
; PLAN: r0=449(x), r1=88(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=11(y), r7=83(width), r8=76(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 449
LDI r1, 88
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 175
LDI r6, 11
LDI r7, 83
LDI r8, 76
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
