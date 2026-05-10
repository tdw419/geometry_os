; DESCRIPTION: Composite: Sets a single yellow pixel at (501, 8) then Places a cyan 100x30 rectangle at position (35, 128).
; PLAN: r0=501(x), r1=8(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=35(x), r6=128(y), r7=100(width), r8=30(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 501
LDI r1, 8
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 35
LDI r6, 128
LDI r7, 100
LDI r8, 30
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
