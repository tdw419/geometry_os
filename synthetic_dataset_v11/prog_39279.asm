; DESCRIPTION: Creates a white circular shape at (196, 67) with radius 40.
; PLAN: r0=196(x), r1=67(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 67
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
