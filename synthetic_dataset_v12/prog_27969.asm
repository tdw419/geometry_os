; DESCRIPTION: Renders a white line between points (309, 41) and (399, 223).
; PLAN: r0=309(x1), r1=41(y1), r2=399(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 41
LDI r2, 399
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
