; DESCRIPTION: Renders a red box of size 67x106 starting at (180, 101).
; PLAN: r0=180(x), r1=101(y), r2=67(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 101
LDI r2, 67
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
