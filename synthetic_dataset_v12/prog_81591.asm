; DESCRIPTION: Renders a blue line between points (264, 42) and (41, 133).
; PLAN: r0=264(x1), r1=42(y1), r2=41(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 42
LDI r2, 41
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
