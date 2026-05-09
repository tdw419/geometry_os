; DESCRIPTION: Renders a purple line between points (58, 202) and (127, 87).
; PLAN: r0=58(x1), r1=202(y1), r2=127(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 202
LDI r2, 127
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
