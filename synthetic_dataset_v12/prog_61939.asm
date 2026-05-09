; DESCRIPTION: Places a white line segment connecting (227, 36) to (289, 242).
; PLAN: r0=227(x1), r1=36(y1), r2=289(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 36
LDI r2, 289
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
