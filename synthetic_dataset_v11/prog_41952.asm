; DESCRIPTION: Renders a purple line between points (159, 57) and (196, 249).
; PLAN: r0=159(x1), r1=57(y1), r2=196(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 57
LDI r2, 196
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
