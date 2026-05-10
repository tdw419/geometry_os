; DESCRIPTION: Composite: Places a orange 98x86 rectangle at position (240, 86) then Sets a single magenta pixel at (89, 231) then Creates a black circular shape at (377, 81) with radius 43.
; PLAN: r0=240(x), r1=86(y), r2=98(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=231(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=377(x), r11=81(y), r12=43(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 240
LDI r1, 86
LDI r2, 98
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 231
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 377
LDI r11, 81
LDI r12, 43
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
