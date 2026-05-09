; DESCRIPTION: Places a blue line segment connecting (458, 195) to (503, 162).
; PLAN: r0=458(x1), r1=195(y1), r2=503(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 195
LDI r2, 503
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
