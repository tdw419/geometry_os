; DESCRIPTION: Renders a red box of size 43x15 starting at (59, 135).
; PLAN: r0=59(x), r1=135(y), r2=43(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 135
LDI r2, 43
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
