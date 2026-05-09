; DESCRIPTION: Renders a blue line between points (481, 13) and (460, 2).
; PLAN: r0=481(x1), r1=13(y1), r2=460(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 13
LDI r2, 460
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
