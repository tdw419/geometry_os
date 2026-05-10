; DESCRIPTION: Renders a red circular shape at (204, 67) with radius 64.
; PLAN: r0=204(x), r1=67(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 67
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
