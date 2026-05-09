; DESCRIPTION: Renders a green line between points (207, 172) and (41, 165).
; PLAN: r0=207(x1), r1=172(y1), r2=41(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 172
LDI r2, 41
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
