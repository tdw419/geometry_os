; DESCRIPTION: Draws a cyan circle centered at (84, 116) with radius 67.
; PLAN: r0=84(x), r1=116(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 116
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
