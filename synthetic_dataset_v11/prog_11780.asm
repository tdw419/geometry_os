; DESCRIPTION: Renders a purple line between points (247, 43) and (127, 241).
; PLAN: r0=247(x1), r1=43(y1), r2=127(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 43
LDI r2, 127
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
