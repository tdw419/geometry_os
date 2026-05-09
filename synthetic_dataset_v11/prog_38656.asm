; DESCRIPTION: Renders a red box of size 26x23 starting at (0, 167).
; PLAN: r0=0(x), r1=167(y), r2=26(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 167
LDI r2, 26
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
