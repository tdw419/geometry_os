; DESCRIPTION: Renders a green line between points (241, 64) and (490, 41).
; PLAN: r0=241(x1), r1=64(y1), r2=490(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 64
LDI r2, 490
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
