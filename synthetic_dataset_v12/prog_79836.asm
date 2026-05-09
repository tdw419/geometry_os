; DESCRIPTION: Renders a blue line between points (298, 105) and (112, 25).
; PLAN: r0=298(x1), r1=105(y1), r2=112(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 105
LDI r2, 112
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
