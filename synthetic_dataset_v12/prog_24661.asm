; DESCRIPTION: Places a black line segment connecting (353, 108) to (53, 60).
; PLAN: r0=353(x1), r1=108(y1), r2=53(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 108
LDI r2, 53
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
