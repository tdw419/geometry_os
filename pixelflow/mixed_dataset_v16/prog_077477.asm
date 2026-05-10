; DESCRIPTION: Composite: Renders a magenta box of size 49x47 starting at (463, 136) then Sets a single yellow pixel at (384, 15) then Draws a black circle centered at (213, 186) with radius 18.
; PLAN: r0=463(x), r1=136(y), r2=49(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=15(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=213(x), r11=186(y), r12=18(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 463
LDI r1, 136
LDI r2, 49
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 15
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 213
LDI r11, 186
LDI r12, 18
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
