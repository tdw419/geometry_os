; DESCRIPTION: Renders a blue line between points (43, 215) and (33, 93).
; PLAN: r0=43(x1), r1=215(y1), r2=33(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 215
LDI r2, 33
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
