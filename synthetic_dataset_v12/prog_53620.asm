; DESCRIPTION: Places a orange line segment connecting (157, 120) to (272, 231).
; PLAN: r0=157(x1), r1=120(y1), r2=272(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 120
LDI r2, 272
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
