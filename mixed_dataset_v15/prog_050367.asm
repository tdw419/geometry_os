; DESCRIPTION: Places a white line segment connecting (86, 123) to (98, 174).
; PLAN: r0=86(x1), r1=123(y1), r2=98(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 123
LDI r2, 98
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
