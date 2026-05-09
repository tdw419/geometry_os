; DESCRIPTION: Composite: Sets a single black pixel at (113, 227) then Places a magenta 98x119 rectangle at position (104, 77).
; PLAN: r0=113(x), r1=227(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=104(x), r6=77(y), r7=98(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 227
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 104
LDI r6, 77
LDI r7, 98
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
