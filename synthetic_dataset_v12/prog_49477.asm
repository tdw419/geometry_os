; DESCRIPTION: Renders a purple line between points (456, 209) and (125, 203).
; PLAN: r0=456(x1), r1=209(y1), r2=125(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 209
LDI r2, 125
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
