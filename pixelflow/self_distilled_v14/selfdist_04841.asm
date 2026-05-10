; DESCRIPTION: Places a red disk with center (104, 24) and radius 67.
; PLAN: r0=104(x), r1=24(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 24
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
