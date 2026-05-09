; DESCRIPTION: Renders a blue line between points (118, 28) and (209, 115).
; PLAN: r0=118(x1), r1=28(y1), r2=209(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 28
LDI r2, 209
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
