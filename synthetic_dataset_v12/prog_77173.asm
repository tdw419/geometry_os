; DESCRIPTION: Renders a red box of size 74x11 starting at (26, 203).
; PLAN: r0=26(x), r1=203(y), r2=74(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 203
LDI r2, 74
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
