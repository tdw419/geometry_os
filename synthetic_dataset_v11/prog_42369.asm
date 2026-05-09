; DESCRIPTION: Renders a green box of size 53x38 starting at (159, 129).
; PLAN: r0=159(x), r1=129(y), r2=53(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 129
LDI r2, 53
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
