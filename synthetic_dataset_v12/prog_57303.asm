; DESCRIPTION: Places a blue line segment connecting (503, 65) to (487, 1).
; PLAN: r0=503(x1), r1=65(y1), r2=487(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 65
LDI r2, 487
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
