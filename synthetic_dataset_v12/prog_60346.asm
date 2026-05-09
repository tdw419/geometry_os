; DESCRIPTION: Places a white line segment connecting (109, 8) to (70, 180).
; PLAN: r0=109(x1), r1=8(y1), r2=70(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 8
LDI r2, 70
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
