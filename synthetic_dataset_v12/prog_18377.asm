; DESCRIPTION: Renders a blue line between points (167, 7) and (456, 89).
; PLAN: r0=167(x1), r1=7(y1), r2=456(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 7
LDI r2, 456
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
