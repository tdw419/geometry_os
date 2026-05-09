; DESCRIPTION: Renders a purple line between points (350, 218) and (107, 126).
; PLAN: r0=350(x1), r1=218(y1), r2=107(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 218
LDI r2, 107
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
