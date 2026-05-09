; DESCRIPTION: Places a blue line segment connecting (466, 12) to (404, 84).
; PLAN: r0=466(x1), r1=12(y1), r2=404(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 12
LDI r2, 404
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
