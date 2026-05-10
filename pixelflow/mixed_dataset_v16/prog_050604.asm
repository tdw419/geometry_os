; DESCRIPTION: Places a magenta line segment connecting (133, 231) to (481, 99).
; PLAN: r0=133(x1), r1=231(y1), r2=481(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 231
LDI r2, 481
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
