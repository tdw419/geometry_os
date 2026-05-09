; DESCRIPTION: Renders a black line between points (161, 77) and (196, 118).
; PLAN: r0=161(x1), r1=77(y1), r2=196(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 77
LDI r2, 196
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
