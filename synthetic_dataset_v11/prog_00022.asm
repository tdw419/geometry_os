; DESCRIPTION: Composite: . Then Places a blue circle of radius 34 at center (135, 105). Then Draws a black line from (36, 164) to (163, 82).
; PLAN: r0=135(x), r1=105(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=36(x1), r1=164(y1), r2=163(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 34 at center (135, 105).
; PLAN: r0=135(x), r1=105(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 105
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (36, 164) to (163, 82).
; PLAN: r0=36(x1), r1=164(y1), r2=163(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 164
LDI r2, 163
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
