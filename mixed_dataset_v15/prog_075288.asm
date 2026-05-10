; DESCRIPTION: Places a magenta line segment connecting (415, 139) to (21, 85).
; PLAN: r0=415(x1), r1=139(y1), r2=21(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 139
LDI r2, 21
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
