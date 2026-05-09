; DESCRIPTION: Composite: Draws a purple circle centered at (48, 161) with radius 18 then Sets a single magenta pixel at (219, 184) then Places a yellow 86x65 rectangle at position (3, 188).
; PLAN: r0=48(x), r1=161(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=184(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=3(x), r11=188(y), r12=86(width), r13=65(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 161
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 184
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 3
LDI r11, 188
LDI r12, 86
LDI r13, 65
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
