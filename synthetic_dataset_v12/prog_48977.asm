; DESCRIPTION: Places a purple line segment connecting (275, 241) to (302, 236).
; PLAN: r0=275(x1), r1=241(y1), r2=302(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 241
LDI r2, 302
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
