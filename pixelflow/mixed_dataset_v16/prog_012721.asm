; DESCRIPTION: Composite: Sets a single blue pixel at (33, 64) then Places a orange 48x95 rectangle at position (381, 138).
; PLAN: r0=33(x), r1=64(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=138(y), r7=48(width), r8=95(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 64
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 381
LDI r6, 138
LDI r7, 48
LDI r8, 95
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
