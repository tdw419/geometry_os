; DESCRIPTION: Places a purple line segment connecting (409, 177) to (288, 153).
; PLAN: r0=409(x1), r1=177(y1), r2=288(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 177
LDI r2, 288
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
