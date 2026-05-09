; DESCRIPTION: Renders a purple line between points (243, 76) and (461, 113).
; PLAN: r0=243(x1), r1=76(y1), r2=461(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 76
LDI r2, 461
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
