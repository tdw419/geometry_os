; DESCRIPTION: Composite: Draws a purple rectangle at (332, 36) with width 30 and height 55 then Sets a single cyan pixel at (79, 199).
; PLAN: r0=332(x), r1=36(y), r2=30(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=199(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 36
LDI r2, 30
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 199
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
