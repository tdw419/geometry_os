; DESCRIPTION: Places a magenta line segment connecting (4, 14) to (75, 162).
; PLAN: r0=4(x1), r1=14(y1), r2=75(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 14
LDI r2, 75
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
