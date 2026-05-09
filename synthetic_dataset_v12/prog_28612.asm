; DESCRIPTION: Renders a red box of size 19x60 starting at (114, 95).
; PLAN: r0=114(x), r1=95(y), r2=19(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 95
LDI r2, 19
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
