; DESCRIPTION: Renders a purple line between points (127, 222) and (81, 129).
; PLAN: r0=127(x1), r1=222(y1), r2=81(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 222
LDI r2, 81
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
