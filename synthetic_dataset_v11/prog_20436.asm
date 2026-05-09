; DESCRIPTION: Renders a purple line between points (57, 207) and (95, 29).
; PLAN: r0=57(x1), r1=207(y1), r2=95(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 207
LDI r2, 95
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
