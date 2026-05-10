; DESCRIPTION: Composite: Places a cyan 75x78 rectangle at position (97, 132) then Places a purple dot at position (397, 182).
; PLAN: r0=97(x), r1=132(y), r2=75(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x), r6=182(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 132
LDI r2, 75
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 182
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
