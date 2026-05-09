; DESCRIPTION: Composite: Places a black 92x62 rectangle at position (274, 65) then Sets a single white pixel at (180, 157) then Draws a blue circle centered at (419, 85) with radius 50.
; PLAN: r0=274(x), r1=65(y), r2=92(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=157(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=419(x), r11=85(y), r12=50(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 65
LDI r2, 92
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 157
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 419
LDI r11, 85
LDI r12, 50
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
