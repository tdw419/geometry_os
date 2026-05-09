; DESCRIPTION: Renders a green box of size 26x53 starting at (219, 184).
; PLAN: r0=219(x), r1=184(y), r2=26(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 184
LDI r2, 26
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
