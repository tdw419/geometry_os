; DESCRIPTION: Places a red line segment connecting (7, 155) to (365, 86).
; PLAN: r0=7(x1), r1=155(y1), r2=365(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 155
LDI r2, 365
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
