; DESCRIPTION: Places a blue line segment connecting (187, 25) to (503, 161).
; PLAN: r0=187(x1), r1=25(y1), r2=503(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 25
LDI r2, 503
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
