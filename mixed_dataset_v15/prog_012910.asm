; DESCRIPTION: Composite: Draws a green rectangle at (69, 102) with width 78 and height 106 then Places a blue dot at position (24, 214).
; PLAN: r0=69(x), r1=102(y), r2=78(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=24(x), r6=214(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 69
LDI r1, 102
LDI r2, 78
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 214
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
