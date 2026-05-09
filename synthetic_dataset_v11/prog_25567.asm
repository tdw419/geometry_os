; DESCRIPTION: Places a magenta line segment connecting (213, 51) to (11, 4).
; PLAN: r0=213(x1), r1=51(y1), r2=11(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 51
LDI r2, 11
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
