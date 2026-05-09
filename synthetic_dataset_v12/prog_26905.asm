; DESCRIPTION: Renders a red box of size 85x35 starting at (382, 135).
; PLAN: r0=382(x), r1=135(y), r2=85(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 135
LDI r2, 85
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
