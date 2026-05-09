; DESCRIPTION: Renders a red line between points (385, 29) and (127, 217).
; PLAN: r0=385(x1), r1=29(y1), r2=127(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 29
LDI r2, 127
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
