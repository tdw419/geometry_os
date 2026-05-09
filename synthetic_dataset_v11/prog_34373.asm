; DESCRIPTION: Renders a purple line between points (52, 133) and (239, 167).
; PLAN: r0=52(x1), r1=133(y1), r2=239(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 133
LDI r2, 239
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
