; DESCRIPTION: Places a purple line segment connecting (494, 31) to (212, 242).
; PLAN: r0=494(x1), r1=31(y1), r2=212(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 31
LDI r2, 212
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
