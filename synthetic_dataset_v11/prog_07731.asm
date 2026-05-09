; DESCRIPTION: Renders a blue line between points (40, 243) and (220, 157).
; PLAN: r0=40(x1), r1=243(y1), r2=220(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 243
LDI r2, 220
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
