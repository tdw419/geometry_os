; DESCRIPTION: Renders a white circular shape at (74, 124) with radius 67.
; PLAN: r0=74(x), r1=124(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 124
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
