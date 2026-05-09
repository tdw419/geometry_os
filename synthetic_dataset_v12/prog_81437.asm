; DESCRIPTION: Renders a green line between points (469, 4) and (334, 41).
; PLAN: r0=469(x1), r1=4(y1), r2=334(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 4
LDI r2, 334
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
