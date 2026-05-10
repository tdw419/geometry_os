; DESCRIPTION: Places a red circle of radius 28 at center (411, 73).
; PLAN: r0=411(x), r1=73(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 73
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
