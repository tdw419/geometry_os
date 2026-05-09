; DESCRIPTION: Places a green line segment connecting (365, 159) to (268, 140).
; PLAN: r0=365(x1), r1=159(y1), r2=268(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 159
LDI r2, 268
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
