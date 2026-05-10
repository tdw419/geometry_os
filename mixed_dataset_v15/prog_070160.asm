; DESCRIPTION: Draws a purple line from (283, 211) to (481, 237).
; PLAN: r0=283(x1), r1=211(y1), r2=481(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 211
LDI r2, 481
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
