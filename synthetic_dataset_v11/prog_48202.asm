; DESCRIPTION: Places a magenta line segment connecting (21, 114) to (87, 118).
; PLAN: r0=21(x1), r1=114(y1), r2=87(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 114
LDI r2, 87
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
