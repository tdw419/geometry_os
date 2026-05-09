; DESCRIPTION: Places a blue line segment connecting (166, 243) to (503, 40).
; PLAN: r0=166(x1), r1=243(y1), r2=503(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 243
LDI r2, 503
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
