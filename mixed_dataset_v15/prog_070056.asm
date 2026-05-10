; DESCRIPTION: Composite: Draws a magenta rectangle at (321, 157) with width 90 and height 85 then Places a blue dot at position (463, 76).
; PLAN: r0=321(x), r1=157(y), r2=90(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x), r6=76(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 157
LDI r2, 90
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 76
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
