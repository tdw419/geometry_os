; DESCRIPTION: Places a black line segment connecting (157, 203) to (403, 25).
; PLAN: r0=157(x1), r1=203(y1), r2=403(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 203
LDI r2, 403
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
