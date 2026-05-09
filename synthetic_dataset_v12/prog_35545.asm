; DESCRIPTION: Renders a black line between points (233, 226) and (44, 40).
; PLAN: r0=233(x1), r1=226(y1), r2=44(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 226
LDI r2, 44
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
