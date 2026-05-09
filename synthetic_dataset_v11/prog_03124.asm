; DESCRIPTION: Composite: . Then Renders a blue line between points (10, 151) and (12, 40). Then Creates a black circular shape at (108, 92) with radius 14.
; PLAN: r0=10(x1), r1=151(y1), r2=12(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=108(x), r1=92(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (10, 151) and (12, 40).
; PLAN: r0=10(x1), r1=151(y1), r2=12(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 151
LDI r2, 12
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (108, 92) with radius 14.
; PLAN: r0=108(x), r1=92(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 92
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
