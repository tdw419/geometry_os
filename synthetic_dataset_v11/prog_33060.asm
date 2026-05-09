; DESCRIPTION: Places a magenta line segment connecting (234, 127) to (187, 85).
; PLAN: r0=234(x1), r1=127(y1), r2=187(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 127
LDI r2, 187
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
