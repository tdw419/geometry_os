; DESCRIPTION: Renders a blue line between points (180, 55) and (118, 164).
; PLAN: r0=180(x1), r1=55(y1), r2=118(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 55
LDI r2, 118
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
