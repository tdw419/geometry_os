; DESCRIPTION: Places a white line segment connecting (58, 98) to (100, 21).
; PLAN: r0=58(x1), r1=98(y1), r2=100(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 98
LDI r2, 100
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
