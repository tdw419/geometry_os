; DESCRIPTION: Places a magenta line segment connecting (131, 241) to (50, 89).
; PLAN: r0=131(x1), r1=241(y1), r2=50(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 241
LDI r2, 50
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
