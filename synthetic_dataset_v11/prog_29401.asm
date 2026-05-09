; DESCRIPTION: Renders a yellow line between points (133, 160) and (74, 239).
; PLAN: r0=133(x1), r1=160(y1), r2=74(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 160
LDI r2, 74
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
