; DESCRIPTION: Places a green line segment connecting (231, 49) to (220, 169).
; PLAN: r0=231(x1), r1=49(y1), r2=220(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 49
LDI r2, 220
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
