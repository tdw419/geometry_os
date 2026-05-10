; DESCRIPTION: Renders a magenta line between points (218, 80) and (286, 216).
; PLAN: r0=218(x1), r1=80(y1), r2=286(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 80
LDI r2, 286
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
