; DESCRIPTION: Renders a red box of size 39x88 starting at (327, 76).
; PLAN: r0=327(x), r1=76(y), r2=39(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 76
LDI r2, 39
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
