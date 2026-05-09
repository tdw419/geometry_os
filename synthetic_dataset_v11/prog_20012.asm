; DESCRIPTION: Places a magenta line segment connecting (217, 134) to (204, 138).
; PLAN: r0=217(x1), r1=134(y1), r2=204(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 134
LDI r2, 204
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
