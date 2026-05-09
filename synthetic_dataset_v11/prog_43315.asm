; DESCRIPTION: Places a white line segment connecting (221, 238) to (98, 4).
; PLAN: r0=221(x1), r1=238(y1), r2=98(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 238
LDI r2, 98
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
