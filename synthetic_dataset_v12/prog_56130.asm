; DESCRIPTION: Renders a purple line between points (239, 76) and (121, 247).
; PLAN: r0=239(x1), r1=76(y1), r2=121(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 76
LDI r2, 121
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
