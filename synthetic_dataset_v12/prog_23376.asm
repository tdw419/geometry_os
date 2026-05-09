; DESCRIPTION: Renders a purple line between points (362, 132) and (337, 192).
; PLAN: r0=362(x1), r1=132(y1), r2=337(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 132
LDI r2, 337
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
