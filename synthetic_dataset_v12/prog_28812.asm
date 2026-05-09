; DESCRIPTION: Draws a purple line from (496, 62) to (237, 219).
; PLAN: r0=496(x1), r1=62(y1), r2=237(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 62
LDI r2, 237
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
