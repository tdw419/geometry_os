; DESCRIPTION: Places a white line segment connecting (142, 243) to (436, 232).
; PLAN: r0=142(x1), r1=243(y1), r2=436(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 243
LDI r2, 436
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
