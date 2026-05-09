; DESCRIPTION: Composite: Draws a blue line from (430, 240) to (412, 94) then Renders a orange disk with center (181, 74) and radius 43.
; PLAN: r0=430(x1), r1=240(y1), r2=412(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=74(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 430
LDI r1, 240
LDI r2, 412
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 74
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
