; DESCRIPTION: Places a blue line segment connecting (182, 229) to (148, 29).
; PLAN: r0=182(x1), r1=229(y1), r2=148(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 229
LDI r2, 148
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
