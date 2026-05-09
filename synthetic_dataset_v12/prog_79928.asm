; DESCRIPTION: Places a magenta line segment connecting (464, 158) to (162, 152).
; PLAN: r0=464(x1), r1=158(y1), r2=162(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 158
LDI r2, 162
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
