; DESCRIPTION: Places a purple line segment connecting (194, 166) to (415, 189).
; PLAN: r0=194(x1), r1=166(y1), r2=415(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 166
LDI r2, 415
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
