; DESCRIPTION: Renders a blue line between points (361, 103) and (359, 41).
; PLAN: r0=361(x1), r1=103(y1), r2=359(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 103
LDI r2, 359
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
