; DESCRIPTION: Places a blue line segment connecting (405, 157) to (359, 120).
; PLAN: r0=405(x1), r1=157(y1), r2=359(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 157
LDI r2, 359
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
