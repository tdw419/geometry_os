; DESCRIPTION: Places a magenta line segment connecting (15, 132) to (51, 196).
; PLAN: r0=15(x1), r1=132(y1), r2=51(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 132
LDI r2, 51
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
