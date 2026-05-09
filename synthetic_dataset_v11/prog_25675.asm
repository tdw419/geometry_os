; DESCRIPTION: Composite: . Then Renders a blue disk with center (124, 106) and radius 66. Then Draws a black line from (100, 19) to (64, 206).
; PLAN: r0=124(x), r1=106(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=100(x1), r1=19(y1), r2=64(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (124, 106) and radius 66.
; PLAN: r0=124(x), r1=106(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 106
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (100, 19) to (64, 206).
; PLAN: r0=100(x1), r1=19(y1), r2=64(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 19
LDI r2, 64
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
