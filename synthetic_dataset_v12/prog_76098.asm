; DESCRIPTION: Renders a white box of size 74x53 starting at (122, 0).
; PLAN: r0=122(x), r1=0(y), r2=74(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 0
LDI r2, 74
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
