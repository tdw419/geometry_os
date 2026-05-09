; DESCRIPTION: Places a magenta line segment connecting (136, 247) to (67, 118).
; PLAN: r0=136(x1), r1=247(y1), r2=67(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 247
LDI r2, 67
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
