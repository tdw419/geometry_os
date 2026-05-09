; DESCRIPTION: Places a cyan circle of radius 57 at center (67, 155).
; PLAN: r0=67(x), r1=155(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 155
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
