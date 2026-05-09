; DESCRIPTION: Places a purple line segment connecting (95, 204) to (32, 202).
; PLAN: r0=95(x1), r1=204(y1), r2=32(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 204
LDI r2, 32
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
