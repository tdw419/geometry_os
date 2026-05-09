; DESCRIPTION: Composite: Renders a yellow box of size 120x105 starting at (121, 131) then Sets a single yellow pixel at (417, 136) then Draws a magenta circle centered at (118, 54) with radius 41.
; PLAN: r0=121(x), r1=131(y), r2=120(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x), r6=136(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=118(x), r11=54(y), r12=41(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 131
LDI r2, 120
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 136
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 118
LDI r11, 54
LDI r12, 41
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
