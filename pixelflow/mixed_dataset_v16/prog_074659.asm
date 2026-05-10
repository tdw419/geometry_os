; DESCRIPTION: Places a purple line segment connecting (283, 73) to (219, 107).
; PLAN: r0=283(x1), r1=73(y1), r2=219(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 73
LDI r2, 219
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
