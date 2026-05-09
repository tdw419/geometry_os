; DESCRIPTION: Places a white line segment connecting (242, 232) to (194, 108).
; PLAN: r0=242(x1), r1=232(y1), r2=194(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 232
LDI r2, 194
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
