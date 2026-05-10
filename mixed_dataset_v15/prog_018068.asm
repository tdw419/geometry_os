; DESCRIPTION: Places a blue line segment connecting (348, 231) to (470, 225).
; PLAN: r0=348(x1), r1=231(y1), r2=470(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 231
LDI r2, 470
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
