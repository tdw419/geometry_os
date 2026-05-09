; DESCRIPTION: Renders a magenta line between points (218, 225) and (124, 179).
; PLAN: r0=218(x1), r1=225(y1), r2=124(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 225
LDI r2, 124
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
