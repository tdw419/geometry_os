; DESCRIPTION: Composite: Sets a single yellow pixel at (337, 198) then Places a red 65x48 rectangle at position (259, 126) then Draws a purple circle centered at (334, 89) with radius 63.
; PLAN: r0=337(x), r1=198(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=126(y), r7=65(width), r8=48(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=334(x), r11=89(y), r12=63(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 198
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 259
LDI r6, 126
LDI r7, 65
LDI r8, 48
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 89
LDI r12, 63
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
