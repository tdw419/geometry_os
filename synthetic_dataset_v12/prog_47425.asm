; DESCRIPTION: Places a magenta line segment connecting (70, 56) to (9, 51).
; PLAN: r0=70(x1), r1=56(y1), r2=9(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 56
LDI r2, 9
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
