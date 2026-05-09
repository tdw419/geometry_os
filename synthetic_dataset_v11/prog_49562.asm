; DESCRIPTION: Places a white line segment connecting (147, 245) to (76, 113).
; PLAN: r0=147(x1), r1=245(y1), r2=76(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 245
LDI r2, 76
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
