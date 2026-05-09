; DESCRIPTION: Places a white line segment connecting (134, 142) to (240, 66).
; PLAN: r0=134(x1), r1=142(y1), r2=240(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 142
LDI r2, 240
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
