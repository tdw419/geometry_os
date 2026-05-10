; DESCRIPTION: Places a green line segment connecting (322, 86) to (77, 90).
; PLAN: r0=322(x1), r1=86(y1), r2=77(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 86
LDI r2, 77
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
