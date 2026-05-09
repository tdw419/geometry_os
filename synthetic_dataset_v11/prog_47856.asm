; DESCRIPTION: Places a magenta line segment connecting (87, 205) to (44, 118).
; PLAN: r0=87(x1), r1=205(y1), r2=44(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 205
LDI r2, 44
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
