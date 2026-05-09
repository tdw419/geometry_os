; DESCRIPTION: Places a green circle of radius 60 at center (167, 115).
; PLAN: r0=167(x), r1=115(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 115
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
