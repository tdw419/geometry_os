; DESCRIPTION: Places a green line segment connecting (212, 180) to (388, 137).
; PLAN: r0=212(x1), r1=180(y1), r2=388(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 180
LDI r2, 388
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
