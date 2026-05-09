; DESCRIPTION: Places a magenta line segment connecting (51, 5) to (160, 203).
; PLAN: r0=51(x1), r1=5(y1), r2=160(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 5
LDI r2, 160
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
