; DESCRIPTION: Places a green line segment connecting (385, 134) to (17, 131).
; PLAN: r0=385(x1), r1=134(y1), r2=17(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 134
LDI r2, 17
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
