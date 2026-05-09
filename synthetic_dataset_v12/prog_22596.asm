; DESCRIPTION: Composite: Sets a single black pixel at (247, 218) then Places a yellow 52x96 rectangle at position (41, 87).
; PLAN: r0=247(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=87(y), r7=52(width), r8=96(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 218
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 41
LDI r6, 87
LDI r7, 52
LDI r8, 96
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
