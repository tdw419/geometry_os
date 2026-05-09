; DESCRIPTION: Composite: . Then Places a blue line segment connecting (134, 20) to (245, 53). Then Creates a orange circular shape at (22, 180) with radius 12.
; PLAN: r0=134(x1), r1=20(y1), r2=245(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=22(x), r1=180(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (134, 20) to (245, 53).
; PLAN: r0=134(x1), r1=20(y1), r2=245(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 20
LDI r2, 245
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (22, 180) with radius 12.
; PLAN: r0=22(x), r1=180(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 180
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
