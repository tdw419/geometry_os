; DESCRIPTION: Places a orange line segment connecting (365, 29) to (272, 115).
; PLAN: r0=365(x1), r1=29(y1), r2=272(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 29
LDI r2, 272
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
