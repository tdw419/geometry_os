; DESCRIPTION: Places a green line segment connecting (143, 102) to (218, 49).
; PLAN: r0=143(x1), r1=102(y1), r2=218(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 102
LDI r2, 218
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
