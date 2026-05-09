; DESCRIPTION: Renders a purple line between points (239, 51) and (249, 153).
; PLAN: r0=239(x1), r1=51(y1), r2=249(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 51
LDI r2, 249
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
