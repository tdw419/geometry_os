; DESCRIPTION: Renders a blue line between points (441, 221) and (481, 5).
; PLAN: r0=441(x1), r1=221(y1), r2=481(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 221
LDI r2, 481
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
