; DESCRIPTION: Places a magenta line segment connecting (191, 90) to (154, 35).
; PLAN: r0=191(x1), r1=90(y1), r2=154(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 90
LDI r2, 154
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
