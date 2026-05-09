; DESCRIPTION: Draws a cyan circle centered at (418, 143) with radius 67.
; PLAN: r0=418(x), r1=143(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 143
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
