; DESCRIPTION: Composite: Sets a single magenta pixel at (469, 17) then Draws a cyan rectangle at (388, 65) with width 27 and height 45.
; PLAN: r0=469(x), r1=17(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=65(y), r7=27(width), r8=45(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 17
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 65
LDI r7, 27
LDI r8, 45
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
