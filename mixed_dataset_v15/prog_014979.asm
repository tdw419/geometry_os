; DESCRIPTION: Composite: Places a purple dot at position (219, 212) then Places a black 74x28 rectangle at position (351, 184).
; PLAN: r0=219(x), r1=212(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=184(y), r7=74(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 212
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 351
LDI r6, 184
LDI r7, 74
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
