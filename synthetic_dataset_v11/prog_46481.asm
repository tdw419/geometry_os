; DESCRIPTION: Places a white line segment connecting (38, 171) to (26, 100).
; PLAN: r0=38(x1), r1=171(y1), r2=26(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 171
LDI r2, 26
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
