; DESCRIPTION: Places a magenta line segment connecting (368, 204) to (478, 240).
; PLAN: r0=368(x1), r1=204(y1), r2=478(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 204
LDI r2, 478
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
