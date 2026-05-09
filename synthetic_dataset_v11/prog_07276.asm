; DESCRIPTION: Renders a blue line between points (50, 98) and (226, 123).
; PLAN: r0=50(x1), r1=98(y1), r2=226(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 98
LDI r2, 226
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
