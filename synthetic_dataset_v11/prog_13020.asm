; DESCRIPTION: Places a green line segment connecting (4, 7) to (14, 140).
; PLAN: r0=4(x1), r1=7(y1), r2=14(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 7
LDI r2, 14
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
