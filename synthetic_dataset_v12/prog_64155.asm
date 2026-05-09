; DESCRIPTION: Composite: Draws a yellow line from (53, 230) to (471, 136) then Places a magenta circle of radius 61 at center (75, 145) then Places a yellow dot at position (158, 219).
; PLAN: r0=53(x1), r1=230(y1), r2=471(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=145(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=158(x), r11=219(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 53
LDI r1, 230
LDI r2, 471
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 145
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 158
LDI r11, 219
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
