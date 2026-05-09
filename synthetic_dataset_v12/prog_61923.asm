; DESCRIPTION: Renders a black line between points (493, 57) and (481, 182).
; PLAN: r0=493(x1), r1=57(y1), r2=481(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 57
LDI r2, 481
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
