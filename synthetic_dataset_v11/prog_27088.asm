; DESCRIPTION: Places a white line segment connecting (169, 91) to (231, 65).
; PLAN: r0=169(x1), r1=91(y1), r2=231(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 91
LDI r2, 231
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
