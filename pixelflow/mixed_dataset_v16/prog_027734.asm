; DESCRIPTION: Places a white line segment connecting (337, 40) to (430, 144).
; PLAN: r0=337(x1), r1=40(y1), r2=430(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 40
LDI r2, 430
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
