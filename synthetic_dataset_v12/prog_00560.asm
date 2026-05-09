; DESCRIPTION: Places a green line segment connecting (478, 160) to (460, 136).
; PLAN: r0=478(x1), r1=160(y1), r2=460(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 160
LDI r2, 460
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
