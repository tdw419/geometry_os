; DESCRIPTION: Places a blue line segment connecting (375, 6) to (323, 174).
; PLAN: r0=375(x1), r1=6(y1), r2=323(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 6
LDI r2, 323
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
