; DESCRIPTION: Places a white line segment connecting (452, 205) to (43, 148).
; PLAN: r0=452(x1), r1=205(y1), r2=43(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 205
LDI r2, 43
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
