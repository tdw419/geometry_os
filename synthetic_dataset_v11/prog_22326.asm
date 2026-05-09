; DESCRIPTION: Places a blue line segment connecting (153, 255) to (207, 196).
; PLAN: r0=153(x1), r1=255(y1), r2=207(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 255
LDI r2, 207
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
