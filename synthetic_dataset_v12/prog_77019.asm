; DESCRIPTION: Places a orange line segment connecting (61, 204) to (303, 176).
; PLAN: r0=61(x1), r1=204(y1), r2=303(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 204
LDI r2, 303
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
