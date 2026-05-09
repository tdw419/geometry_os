; DESCRIPTION: Composite: . Then Places a red line segment connecting (27, 43) to (158, 128). Then Renders a purple disk with center (127, 181) and radius 67.
; PLAN: r0=27(x1), r1=43(y1), r2=158(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=127(x), r1=181(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (27, 43) to (158, 128).
; PLAN: r0=27(x1), r1=43(y1), r2=158(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 43
LDI r2, 158
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (127, 181) and radius 67.
; PLAN: r0=127(x), r1=181(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 181
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
