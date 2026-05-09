; DESCRIPTION: Places a white line segment connecting (3, 80) to (171, 180).
; PLAN: r0=3(x1), r1=80(y1), r2=171(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 80
LDI r2, 171
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
