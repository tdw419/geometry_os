; DESCRIPTION: Draws a cyan circle centered at (325, 77) with radius 67.
; PLAN: r0=325(x), r1=77(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 77
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
