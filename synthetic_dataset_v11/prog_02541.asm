; DESCRIPTION: Renders a magenta line between points (139, 233) and (99, 152).
; PLAN: r0=139(x1), r1=233(y1), r2=99(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 233
LDI r2, 99
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
