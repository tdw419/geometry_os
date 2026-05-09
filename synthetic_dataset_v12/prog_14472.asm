; DESCRIPTION: Renders a black line between points (481, 92) and (102, 27).
; PLAN: r0=481(x1), r1=92(y1), r2=102(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 92
LDI r2, 102
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
