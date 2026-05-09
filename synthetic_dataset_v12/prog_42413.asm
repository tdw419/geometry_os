; DESCRIPTION: Composite: Draws a blue rectangle at (171, 87) with width 51 and height 47 then Places a blue dot at position (271, 147).
; PLAN: r0=171(x), r1=87(y), r2=51(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x), r6=147(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 171
LDI r1, 87
LDI r2, 51
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 147
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
