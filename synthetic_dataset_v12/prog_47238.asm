; DESCRIPTION: Places a yellow line segment connecting (118, 124) to (106, 177).
; PLAN: r0=118(x1), r1=124(y1), r2=106(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 124
LDI r2, 106
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
