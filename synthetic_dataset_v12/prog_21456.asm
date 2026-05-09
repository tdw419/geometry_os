; DESCRIPTION: Renders a red box of size 43x24 starting at (142, 114).
; PLAN: r0=142(x), r1=114(y), r2=43(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 114
LDI r2, 43
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
