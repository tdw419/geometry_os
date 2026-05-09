; DESCRIPTION: Composite: Places a purple dot at position (178, 227) then Draws a magenta rectangle at (36, 107) with width 71 and height 112.
; PLAN: r0=178(x), r1=227(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=107(y), r7=71(width), r8=112(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 227
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 36
LDI r6, 107
LDI r7, 71
LDI r8, 112
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
