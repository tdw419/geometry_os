; DESCRIPTION: Renders a black disk with center (141, 168) and radius 67.
; PLAN: r0=141(x), r1=168(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 168
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
