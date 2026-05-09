; DESCRIPTION: Places a magenta line segment connecting (381, 190) to (494, 241).
; PLAN: r0=381(x1), r1=190(y1), r2=494(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 190
LDI r2, 494
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
