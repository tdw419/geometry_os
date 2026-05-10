; DESCRIPTION: Renders a yellow line segment connecting (100, 171) to (313, 197).
; PLAN: r0=100(x1), r1=171(y1), r2=313(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 171
LDI r2, 313
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
