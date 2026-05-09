; DESCRIPTION: Places a green line segment connecting (338, 115) to (221, 109).
; PLAN: r0=338(x1), r1=115(y1), r2=221(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 115
LDI r2, 221
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
