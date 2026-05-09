; DESCRIPTION: Places a purple line segment connecting (226, 245) to (243, 219).
; PLAN: r0=226(x1), r1=245(y1), r2=243(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 245
LDI r2, 243
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
