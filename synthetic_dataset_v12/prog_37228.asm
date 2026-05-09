; DESCRIPTION: Places a magenta line segment connecting (1, 127) to (38, 207).
; PLAN: r0=1(x1), r1=127(y1), r2=38(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 127
LDI r2, 38
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
