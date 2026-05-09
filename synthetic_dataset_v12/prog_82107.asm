; DESCRIPTION: Renders a purple line between points (120, 226) and (65, 48).
; PLAN: r0=120(x1), r1=226(y1), r2=65(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 226
LDI r2, 65
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
