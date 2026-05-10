; DESCRIPTION: Places a magenta line segment connecting (323, 39) to (372, 118).
; PLAN: r0=323(x1), r1=39(y1), r2=372(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 39
LDI r2, 372
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
