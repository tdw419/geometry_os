; DESCRIPTION: Composite: . Then Places a magenta circle of radius 49 at center (200, 88). Then Places a cyan line segment connecting (254, 35) to (102, 12).
; PLAN: r0=200(x), r1=88(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=254(x1), r1=35(y1), r2=102(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 49 at center (200, 88).
; PLAN: r0=200(x), r1=88(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 88
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (254, 35) to (102, 12).
; PLAN: r0=254(x1), r1=35(y1), r2=102(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 35
LDI r2, 102
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
