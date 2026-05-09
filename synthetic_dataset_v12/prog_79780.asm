; DESCRIPTION: Places a blue line segment connecting (0, 185) to (495, 236).
; PLAN: r0=0(x1), r1=185(y1), r2=495(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 185
LDI r2, 495
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
