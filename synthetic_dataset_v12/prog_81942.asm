; DESCRIPTION: Places a orange line segment connecting (57, 193) to (365, 187).
; PLAN: r0=57(x1), r1=193(y1), r2=365(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 193
LDI r2, 365
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
