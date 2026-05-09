; DESCRIPTION: Composite: . Then Places a yellow dot at position (79, 83). Then Places a orange line segment connecting (231, 57) to (250, 61).
; PLAN: r0=79(x), r1=83(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=231(x1), r1=57(y1), r2=250(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (79, 83).
; PLAN: r0=79(x), r1=83(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 83
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (231, 57) to (250, 61).
; PLAN: r0=231(x1), r1=57(y1), r2=250(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 57
LDI r2, 250
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
