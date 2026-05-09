; DESCRIPTION: Composite: . Then Renders a black line between points (80, 144) and (157, 220). Then Renders a red disk with center (101, 111) and radius 69.
; PLAN: r0=80(x1), r1=144(y1), r2=157(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=101(x), r1=111(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (80, 144) and (157, 220).
; PLAN: r0=80(x1), r1=144(y1), r2=157(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 144
LDI r2, 157
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (101, 111) and radius 69.
; PLAN: r0=101(x), r1=111(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 111
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
