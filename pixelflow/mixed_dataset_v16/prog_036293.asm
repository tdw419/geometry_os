; DESCRIPTION: Places a magenta line segment connecting (26, 192) to (415, 135).
; PLAN: r0=26(x1), r1=192(y1), r2=415(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 192
LDI r2, 415
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
