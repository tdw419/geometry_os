; DESCRIPTION: Renders a purple line between points (209, 203) and (443, 47).
; PLAN: r0=209(x1), r1=203(y1), r2=443(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 203
LDI r2, 443
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
