; DESCRIPTION: Draws a green line from (418, 159) to (90, 89).
; PLAN: r0=418(x1), r1=159(y1), r2=90(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 159
LDI r2, 90
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
