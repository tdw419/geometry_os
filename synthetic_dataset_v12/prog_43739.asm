; DESCRIPTION: Renders a purple line between points (481, 80) and (461, 117).
; PLAN: r0=481(x1), r1=80(y1), r2=461(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 80
LDI r2, 461
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
