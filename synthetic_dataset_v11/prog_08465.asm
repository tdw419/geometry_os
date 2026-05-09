; DESCRIPTION: Renders a purple line between points (161, 38) and (239, 181).
; PLAN: r0=161(x1), r1=38(y1), r2=239(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 38
LDI r2, 239
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
