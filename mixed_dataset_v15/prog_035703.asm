; DESCRIPTION: Composite: Draws a black rectangle at (308, 48) with width 68 and height 36 then Draws a magenta circle centered at (208, 193) with radius 26 then Sets a single magenta pixel at (145, 192).
; PLAN: r0=308(x), r1=48(y), r2=68(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=193(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=145(x), r11=192(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 308
LDI r1, 48
LDI r2, 68
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 193
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 145
LDI r11, 192
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
