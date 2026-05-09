; DESCRIPTION: Places a magenta line segment connecting (127, 144) to (203, 112).
; PLAN: r0=127(x1), r1=144(y1), r2=203(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 144
LDI r2, 203
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
