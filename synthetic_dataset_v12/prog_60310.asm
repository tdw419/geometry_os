; DESCRIPTION: Renders a black line between points (336, 231) and (462, 216).
; PLAN: r0=336(x1), r1=231(y1), r2=462(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 231
LDI r2, 462
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
