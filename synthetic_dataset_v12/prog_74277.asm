; DESCRIPTION: Places a white line segment connecting (76, 149) to (283, 165).
; PLAN: r0=76(x1), r1=149(y1), r2=283(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 149
LDI r2, 283
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
