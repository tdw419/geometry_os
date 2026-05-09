; DESCRIPTION: Renders a red box of size 114x96 starting at (12, 9).
; PLAN: r0=12(x), r1=9(y), r2=114(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 9
LDI r2, 114
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
