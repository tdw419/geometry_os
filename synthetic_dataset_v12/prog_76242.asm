; DESCRIPTION: Draws a green line from (339, 189) to (477, 89).
; PLAN: r0=339(x1), r1=189(y1), r2=477(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 189
LDI r2, 477
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
