; DESCRIPTION: Draws a blue line from (363, 137) to (274, 191).
; PLAN: r0=363(x1), r1=137(y1), r2=274(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 137
LDI r2, 274
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
