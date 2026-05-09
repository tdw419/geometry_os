; DESCRIPTION: Places a white line segment connecting (180, 81) to (250, 3).
; PLAN: r0=180(x1), r1=81(y1), r2=250(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 81
LDI r2, 250
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
