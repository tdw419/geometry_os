; DESCRIPTION: Places a orange line segment connecting (243, 30) to (484, 176).
; PLAN: r0=243(x1), r1=30(y1), r2=484(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 30
LDI r2, 484
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
