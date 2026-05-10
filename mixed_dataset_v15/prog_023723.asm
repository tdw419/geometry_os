; DESCRIPTION: Places a magenta line segment connecting (138, 46) to (71, 142).
; PLAN: r0=138(x1), r1=46(y1), r2=71(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 46
LDI r2, 71
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
