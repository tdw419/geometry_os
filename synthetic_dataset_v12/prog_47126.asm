; DESCRIPTION: Composite: Renders a yellow line between points (231, 236) and (101, 247) then Sets a single purple pixel at (23, 104) then Draws a magenta circle centered at (307, 160) with radius 74.
; PLAN: r0=231(x1), r1=236(y1), r2=101(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=104(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=307(x), r11=160(y), r12=74(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 231
LDI r1, 236
LDI r2, 101
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 104
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 307
LDI r11, 160
LDI r12, 74
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
