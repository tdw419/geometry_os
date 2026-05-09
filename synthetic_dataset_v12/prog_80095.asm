; DESCRIPTION: Renders a blue line between points (289, 146) and (436, 41).
; PLAN: r0=289(x1), r1=146(y1), r2=436(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 146
LDI r2, 436
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
