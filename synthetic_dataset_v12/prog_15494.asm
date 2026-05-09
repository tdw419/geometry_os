; DESCRIPTION: Places a magenta line segment connecting (108, 107) to (133, 178).
; PLAN: r0=108(x1), r1=107(y1), r2=133(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 107
LDI r2, 133
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
