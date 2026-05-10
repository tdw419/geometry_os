; DESCRIPTION: Composite: Draws a yellow rectangle at (383, 182) with width 27 and height 31 then Sets a single yellow pixel at (227, 235).
; PLAN: r0=383(x), r1=182(y), r2=27(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=235(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 182
LDI r2, 27
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 235
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
