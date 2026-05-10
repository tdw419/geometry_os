; DESCRIPTION: Places a magenta line segment connecting (29, 116) to (378, 230).
; PLAN: r0=29(x1), r1=116(y1), r2=378(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 116
LDI r2, 378
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
