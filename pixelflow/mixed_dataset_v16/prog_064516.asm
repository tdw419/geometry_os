; DESCRIPTION: Places a blue line segment connecting (24, 17) to (214, 223).
; PLAN: r0=24(x1), r1=17(y1), r2=214(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 17
LDI r2, 214
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
