; DESCRIPTION: Places a white line segment connecting (317, 255) to (100, 136).
; PLAN: r0=317(x1), r1=255(y1), r2=100(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 255
LDI r2, 100
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
