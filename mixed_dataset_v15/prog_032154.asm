; DESCRIPTION: Places a white line segment connecting (95, 40) to (165, 119).
; PLAN: r0=95(x1), r1=40(y1), r2=165(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 40
LDI r2, 165
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
