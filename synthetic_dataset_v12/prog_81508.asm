; DESCRIPTION: Renders a purple line between points (119, 53) and (440, 213).
; PLAN: r0=119(x1), r1=53(y1), r2=440(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 53
LDI r2, 440
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
