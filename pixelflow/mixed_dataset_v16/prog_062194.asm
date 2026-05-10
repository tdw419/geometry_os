; DESCRIPTION: Places a blue line segment connecting (378, 177) to (87, 27).
; PLAN: r0=378(x1), r1=177(y1), r2=87(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 177
LDI r2, 87
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
