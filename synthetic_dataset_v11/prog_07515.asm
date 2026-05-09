; DESCRIPTION: Renders a black line between points (0, 131) and (121, 27).
; PLAN: r0=0(x1), r1=131(y1), r2=121(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 131
LDI r2, 121
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
