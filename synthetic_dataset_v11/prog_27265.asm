; DESCRIPTION: Renders a blue line between points (143, 180) and (113, 155).
; PLAN: r0=143(x1), r1=180(y1), r2=113(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 180
LDI r2, 113
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
