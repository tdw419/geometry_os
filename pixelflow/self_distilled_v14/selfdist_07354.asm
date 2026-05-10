; DESCRIPTION: Renders a red circular shape at (76, 46) with radius 67.
; PLAN: r0=76(x), r1=46(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 46
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
