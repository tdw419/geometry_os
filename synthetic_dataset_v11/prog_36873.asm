; DESCRIPTION: Draws a black line from (139, 187) to (182, 89).
; PLAN: r0=139(x1), r1=187(y1), r2=182(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 187
LDI r2, 182
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
