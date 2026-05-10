; DESCRIPTION: Composite: Sets a single yellow pixel at (153, 237) then Draws a purple rectangle at (208, 39) with width 18 and height 58.
; PLAN: r0=153(x), r1=237(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=208(x), r6=39(y), r7=18(width), r8=58(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 237
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 208
LDI r6, 39
LDI r7, 18
LDI r8, 58
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
