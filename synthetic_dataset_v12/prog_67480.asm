; DESCRIPTION: Renders a magenta line between points (200, 135) and (124, 86).
; PLAN: r0=200(x1), r1=135(y1), r2=124(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 135
LDI r2, 124
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
