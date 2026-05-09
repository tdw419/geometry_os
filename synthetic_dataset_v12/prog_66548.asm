; DESCRIPTION: Places a green line segment connecting (79, 81) to (500, 163).
; PLAN: r0=79(x1), r1=81(y1), r2=500(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 81
LDI r2, 500
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
