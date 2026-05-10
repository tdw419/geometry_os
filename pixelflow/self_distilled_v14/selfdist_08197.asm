; DESCRIPTION: Renders a yellow line segment connecting (326, 100) to (247, 197).
; PLAN: r0=326(x1), r1=100(y1), r2=247(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 100
LDI r2, 247
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
