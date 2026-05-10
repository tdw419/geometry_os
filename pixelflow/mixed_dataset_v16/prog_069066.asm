; DESCRIPTION: Composite: Draws a magenta circle centered at (432, 114) with radius 19 then Draws a black line from (185, 135) to (71, 133).
; PLAN: r0=432(x), r1=114(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x1), r6=135(y1), r7=71(x2), r8=133(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 114
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 135
LDI r7, 71
LDI r8, 133
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
