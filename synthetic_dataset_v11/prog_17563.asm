; DESCRIPTION: Places a magenta line segment connecting (225, 116) to (51, 158).
; PLAN: r0=225(x1), r1=116(y1), r2=51(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 116
LDI r2, 51
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
