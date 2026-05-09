; DESCRIPTION: Renders a blue box of size 15x53 starting at (204, 129).
; PLAN: r0=204(x), r1=129(y), r2=15(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 129
LDI r2, 15
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
