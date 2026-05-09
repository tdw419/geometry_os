; DESCRIPTION: Places a magenta line segment connecting (151, 223) to (127, 78).
; PLAN: r0=151(x1), r1=223(y1), r2=127(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 223
LDI r2, 127
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
