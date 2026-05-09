; DESCRIPTION: Renders a red line between points (70, 92) and (197, 141).
; PLAN: r0=70(x1), r1=92(y1), r2=197(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 92
LDI r2, 197
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
