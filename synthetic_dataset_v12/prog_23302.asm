; DESCRIPTION: Places a blue line segment connecting (224, 162) to (143, 44).
; PLAN: r0=224(x1), r1=162(y1), r2=143(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 162
LDI r2, 143
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
