; DESCRIPTION: Places a red circle of radius 60 at center (167, 64).
; PLAN: r0=167(x), r1=64(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 64
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
