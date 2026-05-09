; DESCRIPTION: Places a magenta line segment connecting (472, 73) to (501, 187).
; PLAN: r0=472(x1), r1=73(y1), r2=501(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 73
LDI r2, 501
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
