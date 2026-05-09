; DESCRIPTION: Places a green line segment connecting (71, 108) to (28, 49).
; PLAN: r0=71(x1), r1=108(y1), r2=28(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 108
LDI r2, 28
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
