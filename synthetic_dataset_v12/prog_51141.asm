; DESCRIPTION: Renders a magenta line between points (99, 217) and (387, 214).
; PLAN: r0=99(x1), r1=217(y1), r2=387(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 217
LDI r2, 387
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
