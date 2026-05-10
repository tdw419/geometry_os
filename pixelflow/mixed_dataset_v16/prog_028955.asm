; DESCRIPTION: Renders a magenta line between points (443, 20) and (456, 191).
; PLAN: r0=443(x1), r1=20(y1), r2=456(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 20
LDI r2, 456
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
