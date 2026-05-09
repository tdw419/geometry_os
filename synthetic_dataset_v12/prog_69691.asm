; DESCRIPTION: Renders a blue line between points (446, 90) and (33, 179).
; PLAN: r0=446(x1), r1=90(y1), r2=33(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 90
LDI r2, 33
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
