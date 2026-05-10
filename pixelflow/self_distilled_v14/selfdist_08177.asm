; DESCRIPTION: Renders a red line segment connecting (331, 67) to (76, 28).
; PLAN: r0=331(x1), r1=67(y1), r2=76(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 67
LDI r2, 76
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
