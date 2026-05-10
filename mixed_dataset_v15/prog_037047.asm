; DESCRIPTION: Places a magenta line segment connecting (3, 118) to (415, 230).
; PLAN: r0=3(x1), r1=118(y1), r2=415(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 118
LDI r2, 415
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
