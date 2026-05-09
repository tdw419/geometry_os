; DESCRIPTION: Renders a black line between points (40, 210) and (251, 238).
; PLAN: r0=40(x1), r1=210(y1), r2=251(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 210
LDI r2, 251
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
