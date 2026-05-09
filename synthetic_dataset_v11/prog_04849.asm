; DESCRIPTION: Renders a cyan line between points (95, 148) and (149, 53).
; PLAN: r0=95(x1), r1=148(y1), r2=149(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 148
LDI r2, 149
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
