; DESCRIPTION: Places a magenta line segment connecting (25, 145) to (445, 131).
; PLAN: r0=25(x1), r1=145(y1), r2=445(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 145
LDI r2, 445
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
