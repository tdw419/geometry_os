; DESCRIPTION: Renders a red box of size 19x21 starting at (111, 43).
; PLAN: r0=111(x), r1=43(y), r2=19(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 43
LDI r2, 19
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
