; DESCRIPTION: Places a blue line segment connecting (278, 157) to (495, 213).
; PLAN: r0=278(x1), r1=157(y1), r2=495(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 157
LDI r2, 495
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
