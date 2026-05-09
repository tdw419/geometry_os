; DESCRIPTION: Places a red circle of radius 41 at center (48, 74).
; PLAN: r0=48(x), r1=74(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 74
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
