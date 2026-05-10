; DESCRIPTION: Places a blue line segment connecting (503, 61) to (235, 114).
; PLAN: r0=503(x1), r1=61(y1), r2=235(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 61
LDI r2, 235
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
