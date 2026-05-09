; DESCRIPTION: Renders a green line between points (121, 24) and (189, 116).
; PLAN: r0=121(x1), r1=24(y1), r2=189(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 24
LDI r2, 189
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
