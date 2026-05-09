; DESCRIPTION: Renders a white line between points (6, 164) and (76, 121).
; PLAN: r0=6(x1), r1=164(y1), r2=76(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 164
LDI r2, 76
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
