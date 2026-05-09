; DESCRIPTION: Renders a black line between points (65, 81) and (226, 195).
; PLAN: r0=65(x1), r1=81(y1), r2=226(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 81
LDI r2, 226
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
