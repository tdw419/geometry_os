; DESCRIPTION: Composite: . Then Renders a red line between points (32, 68) and (193, 47). Then Renders a purple disk with center (73, 131) and radius 41.
; PLAN: r0=32(x1), r1=68(y1), r2=193(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=73(x), r1=131(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red line between points (32, 68) and (193, 47).
; PLAN: r0=32(x1), r1=68(y1), r2=193(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 68
LDI r2, 193
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (73, 131) and radius 41.
; PLAN: r0=73(x), r1=131(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 131
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
