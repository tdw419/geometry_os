; DESCRIPTION: Renders a red box of size 81x105 starting at (29, 135).
; PLAN: r0=29(x), r1=135(y), r2=81(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 135
LDI r2, 81
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
