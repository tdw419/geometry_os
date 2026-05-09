; DESCRIPTION: Places a white line segment connecting (49, 147) to (108, 132).
; PLAN: r0=49(x1), r1=147(y1), r2=108(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 147
LDI r2, 108
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
