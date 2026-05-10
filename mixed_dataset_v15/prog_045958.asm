; DESCRIPTION: Composite: Draws a purple rectangle at (150, 84) with width 18 and height 62 then Sets a single white pixel at (105, 44).
; PLAN: r0=150(x), r1=84(y), r2=18(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=44(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 84
LDI r2, 18
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 44
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
