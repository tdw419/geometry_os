; DESCRIPTION: Places a magenta line segment connecting (159, 131) to (463, 95).
; PLAN: r0=159(x1), r1=131(y1), r2=463(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 131
LDI r2, 463
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
