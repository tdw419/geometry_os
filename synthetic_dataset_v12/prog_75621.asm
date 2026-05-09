; DESCRIPTION: Composite: Places a black 56x64 rectangle at position (383, 110) then Places a magenta dot at position (339, 111).
; PLAN: r0=383(x), r1=110(y), r2=56(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=111(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 110
LDI r2, 56
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 111
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
