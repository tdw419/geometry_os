; DESCRIPTION: Places a white line segment connecting (226, 60) to (436, 8).
; PLAN: r0=226(x1), r1=60(y1), r2=436(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 60
LDI r2, 436
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
