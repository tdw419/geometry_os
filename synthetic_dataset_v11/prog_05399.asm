; DESCRIPTION: Composite: . Then Places a orange line segment connecting (38, 168) to (107, 8). Then Places a magenta circle of radius 61 at center (147, 88).
; PLAN: r0=38(x1), r1=168(y1), r2=107(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=147(x), r1=88(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange line segment connecting (38, 168) to (107, 8).
; PLAN: r0=38(x1), r1=168(y1), r2=107(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 168
LDI r2, 107
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 61 at center (147, 88).
; PLAN: r0=147(x), r1=88(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 88
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
