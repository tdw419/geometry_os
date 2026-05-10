; DESCRIPTION: Renders a black line between points (306, 124) and (480, 118).
; PLAN: r0=306(x1), r1=124(y1), r2=480(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 124
LDI r2, 480
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
