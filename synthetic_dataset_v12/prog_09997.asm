; DESCRIPTION: Renders a red box of size 29x14 starting at (37, 232).
; PLAN: r0=37(x), r1=232(y), r2=29(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 232
LDI r2, 29
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
