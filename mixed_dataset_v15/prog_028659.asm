; DESCRIPTION: Renders a blue line between points (443, 64) and (134, 254).
; PLAN: r0=443(x1), r1=64(y1), r2=134(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 64
LDI r2, 134
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
