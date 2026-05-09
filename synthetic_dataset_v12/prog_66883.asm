; DESCRIPTION: Places a orange line segment connecting (204, 169) to (425, 239).
; PLAN: r0=204(x1), r1=169(y1), r2=425(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 169
LDI r2, 425
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
