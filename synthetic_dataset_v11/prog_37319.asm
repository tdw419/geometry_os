; DESCRIPTION: Renders a purple line between points (134, 243) and (166, 115).
; PLAN: r0=134(x1), r1=243(y1), r2=166(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 243
LDI r2, 166
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
