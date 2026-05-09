; DESCRIPTION: Places a magenta line segment connecting (231, 251) to (18, 187).
; PLAN: r0=231(x1), r1=251(y1), r2=18(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 251
LDI r2, 18
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
