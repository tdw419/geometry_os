; DESCRIPTION: Places a purple line segment connecting (275, 27) to (251, 227).
; PLAN: r0=275(x1), r1=27(y1), r2=251(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 27
LDI r2, 251
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
