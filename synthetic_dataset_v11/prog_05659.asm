; DESCRIPTION: Places a red circle of radius 43 at center (74, 167).
; PLAN: r0=74(x), r1=167(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 167
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
