; DESCRIPTION: Renders a blue line between points (175, 206) and (376, 41).
; PLAN: r0=175(x1), r1=206(y1), r2=376(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 206
LDI r2, 376
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
