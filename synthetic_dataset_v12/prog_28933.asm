; DESCRIPTION: Composite: Places a purple 100x29 rectangle at position (150, 148) then Draws a blue circle centered at (280, 139) with radius 43 then Sets a single magenta pixel at (145, 108).
; PLAN: r0=150(x), r1=148(y), r2=100(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=139(y), r7=43(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=145(x), r11=108(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 150
LDI r1, 148
LDI r2, 100
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 139
LDI r7, 43
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 145
LDI r11, 108
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
