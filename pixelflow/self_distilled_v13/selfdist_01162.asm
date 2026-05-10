; DESCRIPTION: Renders a white rectangular region spanning 29 by 88 at (238, 24).
; PLAN: r0=238(x), r1=24(y), r2=29(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 24
LDI r2, 29
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
