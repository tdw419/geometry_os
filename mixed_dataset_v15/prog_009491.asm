; DESCRIPTION: Composite: Draws a purple rectangle at (130, 49) with width 50 and height 76 then Sets a single orange pixel at (285, 178).
; PLAN: r0=130(x), r1=49(y), r2=50(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x), r6=178(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 49
LDI r2, 50
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 178
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
