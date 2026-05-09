; DESCRIPTION: Creates a green circular shape at (216, 67) with radius 56.
; PLAN: r0=216(x), r1=67(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 67
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
