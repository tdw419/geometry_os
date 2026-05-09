; DESCRIPTION: Renders a blue line between points (481, 252) and (57, 2).
; PLAN: r0=481(x1), r1=252(y1), r2=57(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 252
LDI r2, 57
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
