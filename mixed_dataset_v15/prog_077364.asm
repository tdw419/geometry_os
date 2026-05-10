; DESCRIPTION: Renders a purple line between points (140, 63) and (295, 147).
; PLAN: r0=140(x1), r1=63(y1), r2=295(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 63
LDI r2, 295
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
