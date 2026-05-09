; DESCRIPTION: Renders a blue line between points (385, 116) and (47, 43).
; PLAN: r0=385(x1), r1=116(y1), r2=47(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 116
LDI r2, 47
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
