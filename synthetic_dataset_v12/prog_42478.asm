; DESCRIPTION: Composite: Draws a yellow line from (494, 94) to (390, 120) then Creates a magenta circular shape at (362, 223) with radius 30.
; PLAN: r0=494(x1), r1=94(y1), r2=390(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=223(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 494
LDI r1, 94
LDI r2, 390
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 223
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
