; DESCRIPTION: Renders a red box of size 15x46 starting at (151, 74).
; PLAN: r0=151(x), r1=74(y), r2=15(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 74
LDI r2, 15
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
