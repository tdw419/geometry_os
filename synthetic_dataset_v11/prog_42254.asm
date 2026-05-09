; DESCRIPTION: Places a blue line segment connecting (84, 155) to (164, 111).
; PLAN: r0=84(x1), r1=155(y1), r2=164(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 155
LDI r2, 164
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
