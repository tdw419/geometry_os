; DESCRIPTION: Renders a blue line between points (12, 17) and (218, 141).
; PLAN: r0=12(x1), r1=17(y1), r2=218(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 17
LDI r2, 218
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
