; DESCRIPTION: Places a black line segment connecting (310, 116) to (169, 108).
; PLAN: r0=310(x1), r1=116(y1), r2=169(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 116
LDI r2, 169
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
