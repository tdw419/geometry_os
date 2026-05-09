; DESCRIPTION: Renders a purple line between points (136, 130) and (443, 220).
; PLAN: r0=136(x1), r1=130(y1), r2=443(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 130
LDI r2, 443
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
