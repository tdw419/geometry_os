; DESCRIPTION: Composite: Places a cyan 107x15 rectangle at position (11, 224) then Places a black dot at position (468, 63).
; PLAN: r0=11(x), r1=224(y), r2=107(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=63(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 11
LDI r1, 224
LDI r2, 107
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 63
LDI r7, 0x000000
PSET r5, r6, r7
HALT
