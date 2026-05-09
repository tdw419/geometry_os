; DESCRIPTION: Composite: Draws a purple rectangle at (200, 24) with width 110 and height 26 then Places a red dot at position (357, 103).
; PLAN: r0=200(x), r1=24(y), r2=110(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=103(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 200
LDI r1, 24
LDI r2, 110
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 103
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
