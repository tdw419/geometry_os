; DESCRIPTION: Renders a blue line between points (437, 146) and (376, 241).
; PLAN: r0=437(x1), r1=146(y1), r2=376(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 146
LDI r2, 376
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
