; DESCRIPTION: Renders a blue line between points (213, 223) and (149, 53).
; PLAN: r0=213(x1), r1=223(y1), r2=149(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 223
LDI r2, 149
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
