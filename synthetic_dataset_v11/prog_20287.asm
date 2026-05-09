; DESCRIPTION: Renders a purple line between points (101, 180) and (82, 19).
; PLAN: r0=101(x1), r1=180(y1), r2=82(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 180
LDI r2, 82
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
