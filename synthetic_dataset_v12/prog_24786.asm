; DESCRIPTION: Places a orange line segment connecting (439, 50) to (333, 176).
; PLAN: r0=439(x1), r1=50(y1), r2=333(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 50
LDI r2, 333
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
