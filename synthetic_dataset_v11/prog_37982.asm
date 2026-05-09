; DESCRIPTION: Renders a white line between points (232, 244) and (61, 167).
; PLAN: r0=232(x1), r1=244(y1), r2=61(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 244
LDI r2, 61
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
