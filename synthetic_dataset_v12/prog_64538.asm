; DESCRIPTION: Places a yellow line segment connecting (403, 94) to (196, 133).
; PLAN: r0=403(x1), r1=94(y1), r2=196(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 94
LDI r2, 196
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
