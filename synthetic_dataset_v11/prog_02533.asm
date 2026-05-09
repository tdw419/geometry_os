; DESCRIPTION: Places a white line segment connecting (101, 193) to (75, 6).
; PLAN: r0=101(x1), r1=193(y1), r2=75(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 193
LDI r2, 75
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
