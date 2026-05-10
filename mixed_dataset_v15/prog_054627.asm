; DESCRIPTION: Renders a red circular shape at (388, 67) with radius 66.
; PLAN: r0=388(x), r1=67(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 67
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
