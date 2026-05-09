; DESCRIPTION: Places a magenta line segment connecting (167, 162) to (162, 45).
; PLAN: r0=167(x1), r1=162(y1), r2=162(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 162
LDI r2, 162
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
