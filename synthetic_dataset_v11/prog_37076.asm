; DESCRIPTION: Places a blue line segment connecting (189, 164) to (187, 85).
; PLAN: r0=189(x1), r1=164(y1), r2=187(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 164
LDI r2, 187
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
