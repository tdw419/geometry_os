; DESCRIPTION: Composite: Renders a yellow box of size 23x31 starting at (269, 195) then Draws a magenta circle centered at (163, 111) with radius 35 then Sets a single yellow pixel at (145, 134).
; PLAN: r0=269(x), r1=195(y), r2=23(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x), r6=111(y), r7=35(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=145(x), r11=134(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 269
LDI r1, 195
LDI r2, 23
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 111
LDI r7, 35
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 145
LDI r11, 134
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
