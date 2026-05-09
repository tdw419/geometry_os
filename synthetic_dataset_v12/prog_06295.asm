; DESCRIPTION: Places a white line segment connecting (68, 127) to (101, 89).
; PLAN: r0=68(x1), r1=127(y1), r2=101(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 127
LDI r2, 101
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
