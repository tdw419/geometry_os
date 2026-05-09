; DESCRIPTION: Renders a blue line between points (3, 27) and (481, 168).
; PLAN: r0=3(x1), r1=27(y1), r2=481(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 27
LDI r2, 481
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
