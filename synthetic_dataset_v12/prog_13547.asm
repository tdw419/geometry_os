; DESCRIPTION: Places a purple line segment connecting (415, 95) to (412, 103).
; PLAN: r0=415(x1), r1=95(y1), r2=412(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 95
LDI r2, 412
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
