; DESCRIPTION: Composite: Places a cyan 19x90 rectangle at position (481, 128) then Sets a single purple pixel at (190, 23).
; PLAN: r0=481(x), r1=128(y), r2=19(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=23(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 481
LDI r1, 128
LDI r2, 19
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 23
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
