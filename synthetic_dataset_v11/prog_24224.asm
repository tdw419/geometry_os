; DESCRIPTION: Composite: . Then Renders a purple disk with center (117, 28) and radius 13. Then Places a black line segment connecting (142, 59) to (38, 158).
; PLAN: r0=117(x), r1=28(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=142(x1), r1=59(y1), r2=38(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (117, 28) and radius 13.
; PLAN: r0=117(x), r1=28(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 28
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black line segment connecting (142, 59) to (38, 158).
; PLAN: r0=142(x1), r1=59(y1), r2=38(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 59
LDI r2, 38
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
