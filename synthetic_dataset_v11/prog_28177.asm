; DESCRIPTION: Renders a red box of size 116x40 starting at (29, 205).
; PLAN: r0=29(x), r1=205(y), r2=116(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 205
LDI r2, 116
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
