; DESCRIPTION: Composite: Draws a purple rectangle at (372, 36) with width 115 and height 31 then Places a yellow dot at position (350, 108).
; PLAN: r0=372(x), r1=36(y), r2=115(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=108(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 36
LDI r2, 115
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 108
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
