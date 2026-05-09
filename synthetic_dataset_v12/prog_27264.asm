; DESCRIPTION: Places a green line segment connecting (67, 57) to (289, 5).
; PLAN: r0=67(x1), r1=57(y1), r2=289(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 57
LDI r2, 289
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
