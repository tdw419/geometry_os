; DESCRIPTION: Draws a cyan circle centered at (299, 119) with radius 67.
; PLAN: r0=299(x), r1=119(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 119
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
