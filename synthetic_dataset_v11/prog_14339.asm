; DESCRIPTION: Composite: . Then Places a black line segment connecting (30, 37) to (204, 30). Then Renders a magenta disk with center (96, 115) and radius 74.
; PLAN: r0=30(x1), r1=37(y1), r2=204(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=96(x), r1=115(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black line segment connecting (30, 37) to (204, 30).
; PLAN: r0=30(x1), r1=37(y1), r2=204(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 37
LDI r2, 204
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (96, 115) and radius 74.
; PLAN: r0=96(x), r1=115(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 115
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
