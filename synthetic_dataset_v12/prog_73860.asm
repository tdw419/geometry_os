; DESCRIPTION: Renders a white box of size 43x88 starting at (146, 101).
; PLAN: r0=146(x), r1=101(y), r2=43(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 101
LDI r2, 43
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
