; DESCRIPTION: Renders a green line between points (165, 135) and (155, 155).
; PLAN: r0=165(x1), r1=135(y1), r2=155(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 135
LDI r2, 155
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
