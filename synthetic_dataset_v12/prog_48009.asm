; DESCRIPTION: Composite: Draws a purple rectangle at (299, 33) with width 98 and height 110 then Places a white dot at position (388, 209).
; PLAN: r0=299(x), r1=33(y), r2=98(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=209(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 299
LDI r1, 33
LDI r2, 98
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 209
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
