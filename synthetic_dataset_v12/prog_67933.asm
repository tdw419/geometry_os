; DESCRIPTION: Places a green line segment connecting (378, 116) to (322, 85).
; PLAN: r0=378(x1), r1=116(y1), r2=322(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 116
LDI r2, 322
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
