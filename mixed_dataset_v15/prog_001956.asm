; DESCRIPTION: Composite: Sets a single black pixel at (192, 60) then Places a purple 71x15 rectangle at position (145, 218).
; PLAN: r0=192(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=218(y), r7=71(width), r8=15(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 60
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 145
LDI r6, 218
LDI r7, 71
LDI r8, 15
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
