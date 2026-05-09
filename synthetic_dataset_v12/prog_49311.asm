; DESCRIPTION: Places a blue line segment connecting (105, 253) to (288, 241).
; PLAN: r0=105(x1), r1=253(y1), r2=288(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 253
LDI r2, 288
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
