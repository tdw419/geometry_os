; DESCRIPTION: Renders a purple line between points (143, 214) and (204, 223).
; PLAN: r0=143(x1), r1=214(y1), r2=204(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 214
LDI r2, 204
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
