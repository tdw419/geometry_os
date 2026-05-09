; DESCRIPTION: Places a white line segment connecting (26, 250) to (271, 156).
; PLAN: r0=26(x1), r1=250(y1), r2=271(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 250
LDI r2, 271
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
