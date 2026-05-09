; DESCRIPTION: Places a green line segment connecting (472, 154) to (270, 212).
; PLAN: r0=472(x1), r1=154(y1), r2=270(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 154
LDI r2, 270
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
