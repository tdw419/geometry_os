; DESCRIPTION: Places a red circle of radius 71 at center (167, 142).
; PLAN: r0=167(x), r1=142(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 142
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
