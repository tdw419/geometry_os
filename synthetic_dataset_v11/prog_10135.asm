; DESCRIPTION: Renders a white line between points (184, 221) and (121, 79).
; PLAN: r0=184(x1), r1=221(y1), r2=121(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 221
LDI r2, 121
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
