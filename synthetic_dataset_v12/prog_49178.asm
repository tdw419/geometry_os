; DESCRIPTION: Places a black line segment connecting (294, 69) to (492, 67).
; PLAN: r0=294(x1), r1=69(y1), r2=492(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 69
LDI r2, 492
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
