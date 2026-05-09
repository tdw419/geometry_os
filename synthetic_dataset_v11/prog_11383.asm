; DESCRIPTION: Renders a purple line between points (134, 236) and (138, 117).
; PLAN: r0=134(x1), r1=236(y1), r2=138(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 236
LDI r2, 138
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
