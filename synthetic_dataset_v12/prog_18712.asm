; DESCRIPTION: Places a green line segment connecting (193, 77) to (412, 62).
; PLAN: r0=193(x1), r1=77(y1), r2=412(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 77
LDI r2, 412
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
