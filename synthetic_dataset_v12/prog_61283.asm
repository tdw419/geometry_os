; DESCRIPTION: Places a green line segment connecting (156, 86) to (79, 41).
; PLAN: r0=156(x1), r1=86(y1), r2=79(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 86
LDI r2, 79
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
