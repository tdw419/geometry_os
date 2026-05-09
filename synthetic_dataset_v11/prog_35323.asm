; DESCRIPTION: Places a magenta line segment connecting (77, 133) to (51, 173).
; PLAN: r0=77(x1), r1=133(y1), r2=51(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 133
LDI r2, 51
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
