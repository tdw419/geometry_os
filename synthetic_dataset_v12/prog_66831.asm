; DESCRIPTION: Places a white line segment connecting (313, 78) to (271, 87).
; PLAN: r0=313(x1), r1=78(y1), r2=271(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 78
LDI r2, 271
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
