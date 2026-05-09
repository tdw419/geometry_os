; DESCRIPTION: Places a green line segment connecting (9, 60) to (10, 54).
; PLAN: r0=9(x1), r1=60(y1), r2=10(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 60
LDI r2, 10
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
