; DESCRIPTION: Renders a red line between points (72, 238) and (223, 57).
; PLAN: r0=72(x1), r1=238(y1), r2=223(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 238
LDI r2, 223
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
