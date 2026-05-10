; DESCRIPTION: Places a green line segment connecting (80, 212) to (264, 101).
; PLAN: r0=80(x1), r1=212(y1), r2=264(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 212
LDI r2, 264
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
