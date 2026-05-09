; DESCRIPTION: Renders a yellow line between points (401, 59) and (133, 145).
; PLAN: r0=401(x1), r1=59(y1), r2=133(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 59
LDI r2, 133
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
