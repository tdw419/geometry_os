; DESCRIPTION: Places a white line segment connecting (250, 102) to (149, 239).
; PLAN: r0=250(x1), r1=102(y1), r2=149(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 102
LDI r2, 149
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
