; DESCRIPTION: Places a magenta line segment connecting (161, 8) to (311, 222).
; PLAN: r0=161(x1), r1=8(y1), r2=311(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 8
LDI r2, 311
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
