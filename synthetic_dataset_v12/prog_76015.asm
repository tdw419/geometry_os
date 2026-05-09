; DESCRIPTION: Places a white line segment connecting (299, 8) to (211, 240).
; PLAN: r0=299(x1), r1=8(y1), r2=211(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 8
LDI r2, 211
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
