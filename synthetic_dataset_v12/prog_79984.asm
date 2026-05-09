; DESCRIPTION: Places a magenta line segment connecting (398, 131) to (127, 100).
; PLAN: r0=398(x1), r1=131(y1), r2=127(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 131
LDI r2, 127
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
