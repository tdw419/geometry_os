; DESCRIPTION: Places a green line segment connecting (384, 88) to (289, 108).
; PLAN: r0=384(x1), r1=88(y1), r2=289(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 88
LDI r2, 289
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
