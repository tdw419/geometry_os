; DESCRIPTION: Composite: . Then Places a red line segment connecting (49, 247) to (39, 78). Then Creates a yellow circular shape at (133, 40) with radius 14.
; PLAN: r0=49(x1), r1=247(y1), r2=39(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=133(x), r1=40(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (49, 247) to (39, 78).
; PLAN: r0=49(x1), r1=247(y1), r2=39(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 247
LDI r2, 39
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (133, 40) with radius 14.
; PLAN: r0=133(x), r1=40(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 40
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
