; DESCRIPTION: Places a yellow line segment connecting (422, 37) to (92, 163).
; PLAN: r0=422(x1), r1=37(y1), r2=92(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 37
LDI r2, 92
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
