; DESCRIPTION: Renders a white line between points (54, 122) and (6, 41).
; PLAN: r0=54(x1), r1=122(y1), r2=6(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 122
LDI r2, 6
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
