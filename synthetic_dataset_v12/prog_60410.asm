; DESCRIPTION: Renders a black line between points (230, 47) and (225, 29).
; PLAN: r0=230(x1), r1=47(y1), r2=225(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 47
LDI r2, 225
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
