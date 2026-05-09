; DESCRIPTION: Places a white line segment connecting (119, 35) to (147, 174).
; PLAN: r0=119(x1), r1=35(y1), r2=147(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 35
LDI r2, 147
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
