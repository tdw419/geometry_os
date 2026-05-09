; DESCRIPTION: Renders a yellow line between points (113, 69) and (47, 118).
; PLAN: r0=113(x1), r1=69(y1), r2=47(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 69
LDI r2, 47
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
