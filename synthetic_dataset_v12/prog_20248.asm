; DESCRIPTION: Places a yellow line segment connecting (210, 38) to (2, 237).
; PLAN: r0=210(x1), r1=38(y1), r2=2(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 38
LDI r2, 2
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
