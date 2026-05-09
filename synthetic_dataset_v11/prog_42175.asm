; DESCRIPTION: Renders a white line between points (141, 111) and (95, 155).
; PLAN: r0=141(x1), r1=111(y1), r2=95(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 111
LDI r2, 95
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
