; DESCRIPTION: Places a white line segment connecting (113, 14) to (353, 90).
; PLAN: r0=113(x1), r1=14(y1), r2=353(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 14
LDI r2, 353
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
