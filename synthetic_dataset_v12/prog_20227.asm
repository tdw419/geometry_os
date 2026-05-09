; DESCRIPTION: Places a green circle of radius 51 at center (167, 67).
; PLAN: r0=167(x), r1=67(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 67
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
