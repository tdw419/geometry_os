; DESCRIPTION: Places a red line segment connecting (170, 114) to (231, 130).
; PLAN: r0=170(x1), r1=114(y1), r2=231(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 114
LDI r2, 231
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
