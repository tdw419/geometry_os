; DESCRIPTION: Places a magenta line segment connecting (179, 250) to (26, 55).
; PLAN: r0=179(x1), r1=250(y1), r2=26(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 250
LDI r2, 26
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
