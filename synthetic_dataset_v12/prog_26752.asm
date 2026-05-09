; DESCRIPTION: Places a orange line segment connecting (433, 57) to (365, 10).
; PLAN: r0=433(x1), r1=57(y1), r2=365(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 57
LDI r2, 365
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
