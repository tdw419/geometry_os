; DESCRIPTION: Places a purple line segment connecting (341, 9) to (502, 133).
; PLAN: r0=341(x1), r1=9(y1), r2=502(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 9
LDI r2, 502
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
