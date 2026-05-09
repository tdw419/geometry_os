; DESCRIPTION: Renders a blue line between points (121, 188) and (207, 71).
; PLAN: r0=121(x1), r1=188(y1), r2=207(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 188
LDI r2, 207
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
