; DESCRIPTION: Places a green line segment connecting (345, 177) to (438, 56).
; PLAN: r0=345(x1), r1=177(y1), r2=438(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 177
LDI r2, 438
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
