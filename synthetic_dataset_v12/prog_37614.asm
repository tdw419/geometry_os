; DESCRIPTION: Places a magenta line segment connecting (174, 3) to (80, 15).
; PLAN: r0=174(x1), r1=3(y1), r2=80(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 3
LDI r2, 80
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
