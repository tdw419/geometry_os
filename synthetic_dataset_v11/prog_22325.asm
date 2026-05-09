; DESCRIPTION: Places a white line segment connecting (240, 250) to (67, 36).
; PLAN: r0=240(x1), r1=250(y1), r2=67(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 250
LDI r2, 67
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
