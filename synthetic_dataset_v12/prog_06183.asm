; DESCRIPTION: Renders a magenta line between points (469, 124) and (119, 77).
; PLAN: r0=469(x1), r1=124(y1), r2=119(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 124
LDI r2, 119
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
