; DESCRIPTION: Places a red circle of radius 41 at center (146, 116).
; PLAN: r0=146(x), r1=116(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 116
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
