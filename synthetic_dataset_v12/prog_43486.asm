; DESCRIPTION: Composite: Draws a purple rectangle at (401, 139) with width 75 and height 73 then Sets a single black pixel at (504, 126).
; PLAN: r0=401(x), r1=139(y), r2=75(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x), r6=126(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 401
LDI r1, 139
LDI r2, 75
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 126
LDI r7, 0x000000
PSET r5, r6, r7
HALT
