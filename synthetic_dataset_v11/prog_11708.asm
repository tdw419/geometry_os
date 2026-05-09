; DESCRIPTION: Places a white line segment connecting (67, 251) to (80, 127).
; PLAN: r0=67(x1), r1=251(y1), r2=80(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 251
LDI r2, 80
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
