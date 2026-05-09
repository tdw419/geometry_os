; DESCRIPTION: Places a green line segment connecting (160, 238) to (270, 70).
; PLAN: r0=160(x1), r1=238(y1), r2=270(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 238
LDI r2, 270
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
