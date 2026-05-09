; DESCRIPTION: Places a blue line segment connecting (106, 147) to (405, 61).
; PLAN: r0=106(x1), r1=147(y1), r2=405(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 147
LDI r2, 405
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
