; DESCRIPTION: Places a white line segment connecting (53, 16) to (424, 119).
; PLAN: r0=53(x1), r1=16(y1), r2=424(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 16
LDI r2, 424
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
