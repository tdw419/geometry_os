; DESCRIPTION: Places a white line segment connecting (113, 90) to (12, 238).
; PLAN: r0=113(x1), r1=90(y1), r2=12(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 90
LDI r2, 12
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
