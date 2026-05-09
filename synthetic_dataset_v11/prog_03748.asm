; DESCRIPTION: Places a white line segment connecting (62, 214) to (150, 140).
; PLAN: r0=62(x1), r1=214(y1), r2=150(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 214
LDI r2, 150
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
