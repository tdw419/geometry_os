; DESCRIPTION: Places a magenta line segment connecting (138, 46) to (124, 138).
; PLAN: r0=138(x1), r1=46(y1), r2=124(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 46
LDI r2, 124
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
