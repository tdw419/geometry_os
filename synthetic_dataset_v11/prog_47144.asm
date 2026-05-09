; DESCRIPTION: Places a white line segment connecting (60, 11) to (140, 160).
; PLAN: r0=60(x1), r1=11(y1), r2=140(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 11
LDI r2, 140
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
