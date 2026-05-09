; DESCRIPTION: Places a black line segment connecting (253, 122) to (19, 241).
; PLAN: r0=253(x1), r1=122(y1), r2=19(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 122
LDI r2, 19
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
