; DESCRIPTION: Places a green line segment connecting (160, 135) to (161, 185).
; PLAN: r0=160(x1), r1=135(y1), r2=161(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 135
LDI r2, 161
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
