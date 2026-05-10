; DESCRIPTION: Composite: Places a purple dot at position (375, 236) then Places a cyan 120x18 rectangle at position (319, 81).
; PLAN: r0=375(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=81(y), r7=120(width), r8=18(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 236
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 81
LDI r7, 120
LDI r8, 18
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
