; DESCRIPTION: Places a red line segment connecting (354, 144) to (300, 216).
; PLAN: r0=354(x1), r1=144(y1), r2=300(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 144
LDI r2, 300
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
