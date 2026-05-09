; DESCRIPTION: Composite: Sets a single yellow pixel at (149, 138) then Places a magenta 113x54 rectangle at position (285, 63) then Places a purple circle of radius 20 at center (201, 219).
; PLAN: r0=149(x), r1=138(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=63(y), r7=113(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x), r11=219(y), r12=20(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 149
LDI r1, 138
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 285
LDI r6, 63
LDI r7, 113
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 219
LDI r12, 20
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
