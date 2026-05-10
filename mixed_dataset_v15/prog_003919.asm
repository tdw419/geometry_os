; DESCRIPTION: Composite: Draws a magenta rectangle at (168, 48) with width 79 and height 63 then Creates a purple circular shape at (456, 142) with radius 13 then Sets a single cyan pixel at (455, 9).
; PLAN: r0=168(x), r1=48(y), r2=79(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=142(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=455(x), r11=9(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 168
LDI r1, 48
LDI r2, 79
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 142
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 455
LDI r11, 9
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
