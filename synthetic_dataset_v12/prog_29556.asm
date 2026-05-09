; DESCRIPTION: Renders a magenta line between points (407, 87) and (129, 170).
; PLAN: r0=407(x1), r1=87(y1), r2=129(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 87
LDI r2, 129
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
