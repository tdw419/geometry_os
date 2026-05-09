; DESCRIPTION: Renders a blue line between points (82, 247) and (35, 94).
; PLAN: r0=82(x1), r1=247(y1), r2=35(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 247
LDI r2, 35
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
