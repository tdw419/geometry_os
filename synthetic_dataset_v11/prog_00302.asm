; DESCRIPTION: Places a green line segment connecting (54, 108) to (231, 154).
; PLAN: r0=54(x1), r1=108(y1), r2=231(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 108
LDI r2, 231
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
