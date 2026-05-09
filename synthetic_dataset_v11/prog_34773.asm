; DESCRIPTION: Renders a red box of size 59x28 starting at (122, 22).
; PLAN: r0=122(x), r1=22(y), r2=59(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 22
LDI r2, 59
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
