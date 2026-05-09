; DESCRIPTION: Composite: . Then Renders a magenta disk with center (85, 113) and radius 23. Then Places a green line segment connecting (88, 18) to (221, 14).
; PLAN: r0=85(x), r1=113(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=88(x1), r1=18(y1), r2=221(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (85, 113) and radius 23.
; PLAN: r0=85(x), r1=113(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 113
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green line segment connecting (88, 18) to (221, 14).
; PLAN: r0=88(x1), r1=18(y1), r2=221(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 18
LDI r2, 221
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
