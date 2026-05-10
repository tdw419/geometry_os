; DESCRIPTION: Composite: Sets a single blue pixel at (288, 207) then Draws a purple rectangle at (71, 20) with width 35 and height 81.
; PLAN: r0=288(x), r1=207(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=71(x), r6=20(y), r7=35(width), r8=81(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 207
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 71
LDI r6, 20
LDI r7, 35
LDI r8, 81
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
