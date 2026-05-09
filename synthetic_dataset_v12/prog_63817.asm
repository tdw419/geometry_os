; DESCRIPTION: Places a blue line segment connecting (171, 241) to (195, 245).
; PLAN: r0=171(x1), r1=241(y1), r2=195(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 241
LDI r2, 195
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
