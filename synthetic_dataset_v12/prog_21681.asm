; DESCRIPTION: Places a magenta line segment connecting (494, 218) to (87, 94).
; PLAN: r0=494(x1), r1=218(y1), r2=87(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 218
LDI r2, 87
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
