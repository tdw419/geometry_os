; DESCRIPTION: Composite: Sets a single black pixel at (417, 116) then Creates a magenta rectangular region at (449, 6) spanning 18 by 100 pixels.
; PLAN: r0=417(x), r1=116(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=449(x), r6=6(y), r7=18(width), r8=100(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 116
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 449
LDI r6, 6
LDI r7, 18
LDI r8, 100
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
