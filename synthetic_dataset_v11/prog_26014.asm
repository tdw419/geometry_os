; DESCRIPTION: Places a green line segment connecting (40, 238) to (125, 60).
; PLAN: r0=40(x1), r1=238(y1), r2=125(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 238
LDI r2, 125
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
