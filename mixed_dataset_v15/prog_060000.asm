; DESCRIPTION: Renders a blue line between points (380, 155) and (509, 191).
; PLAN: r0=380(x1), r1=155(y1), r2=509(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 155
LDI r2, 509
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
