; DESCRIPTION: Composite: . Then Places a red circle of radius 70 at center (149, 76). Then Places a white line segment connecting (153, 88) to (93, 222).
; PLAN: r0=149(x), r1=76(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=153(x1), r1=88(y1), r2=93(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 70 at center (149, 76).
; PLAN: r0=149(x), r1=76(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 76
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white line segment connecting (153, 88) to (93, 222).
; PLAN: r0=153(x1), r1=88(y1), r2=93(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 88
LDI r2, 93
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
