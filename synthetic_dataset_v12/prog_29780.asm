; DESCRIPTION: Composite: Places a magenta 114x82 rectangle at position (259, 51) then Draws a orange circle centered at (201, 140) with radius 24.
; PLAN: r0=259(x), r1=51(y), r2=114(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=140(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 259
LDI r1, 51
LDI r2, 114
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 140
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
