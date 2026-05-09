; DESCRIPTION: Composite: . Then Renders a yellow disk with center (127, 121) and radius 64. Then Draws a purple line from (44, 246) to (2, 232).
; PLAN: r0=127(x), r1=121(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=44(x1), r1=246(y1), r2=2(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (127, 121) and radius 64.
; PLAN: r0=127(x), r1=121(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 121
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (44, 246) to (2, 232).
; PLAN: r0=44(x1), r1=246(y1), r2=2(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 246
LDI r2, 2
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
