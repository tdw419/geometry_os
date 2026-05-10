; DESCRIPTION: Draws a green line from (89, 134) to (381, 131).
; PLAN: r0=89(x1), r1=134(y1), r2=381(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 134
LDI r2, 381
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
