; DESCRIPTION: Composite: Places a cyan line segment connecting (326, 195) to (141, 232) then Places a yellow dot at position (462, 27) then Draws a red circle centered at (86, 86) with radius 73.
; PLAN: r0=326(x1), r1=195(y1), r2=141(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=462(x), r6=27(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=86(x), r11=86(y), r12=73(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 326
LDI r1, 195
LDI r2, 141
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 27
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 86
LDI r11, 86
LDI r12, 73
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
