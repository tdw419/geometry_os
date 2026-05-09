; DESCRIPTION: Places a green line segment connecting (458, 185) to (424, 199).
; PLAN: r0=458(x1), r1=185(y1), r2=424(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 185
LDI r2, 424
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
