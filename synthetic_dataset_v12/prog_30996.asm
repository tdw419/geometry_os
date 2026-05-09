; DESCRIPTION: Draws a purple line from (41, 37) to (281, 93).
; PLAN: r0=41(x1), r1=37(y1), r2=281(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 37
LDI r2, 281
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
