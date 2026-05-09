; DESCRIPTION: Draws a white line from (159, 18) to (89, 231).
; PLAN: r0=159(x1), r1=18(y1), r2=89(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 18
LDI r2, 89
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
