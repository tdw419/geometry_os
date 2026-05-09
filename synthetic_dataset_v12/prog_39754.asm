; DESCRIPTION: Places a black line segment connecting (400, 67) to (359, 177).
; PLAN: r0=400(x1), r1=67(y1), r2=359(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 67
LDI r2, 359
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
