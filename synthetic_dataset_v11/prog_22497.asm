; DESCRIPTION: Creates a red circular shape at (84, 98) with radius 67.
; PLAN: r0=84(x), r1=98(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 98
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
