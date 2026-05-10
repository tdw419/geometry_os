; DESCRIPTION: Places a black line segment connecting (400, 47) to (375, 67).
; PLAN: r0=400(x1), r1=47(y1), r2=375(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 47
LDI r2, 375
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
