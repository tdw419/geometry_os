; DESCRIPTION: Places a blue line segment connecting (192, 196) to (203, 168).
; PLAN: r0=192(x1), r1=196(y1), r2=203(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 196
LDI r2, 203
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
