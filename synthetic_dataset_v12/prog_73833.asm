; DESCRIPTION: Renders a red box of size 46x105 starting at (49, 62).
; PLAN: r0=49(x), r1=62(y), r2=46(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 62
LDI r2, 46
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
