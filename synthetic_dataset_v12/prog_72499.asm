; DESCRIPTION: Renders a blue line between points (481, 243) and (184, 248).
; PLAN: r0=481(x1), r1=243(y1), r2=184(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 243
LDI r2, 184
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
