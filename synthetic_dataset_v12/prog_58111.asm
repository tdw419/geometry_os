; DESCRIPTION: Places a blue line segment connecting (92, 204) to (452, 52).
; PLAN: r0=92(x1), r1=204(y1), r2=452(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 204
LDI r2, 452
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
