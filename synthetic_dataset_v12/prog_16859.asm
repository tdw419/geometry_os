; DESCRIPTION: Renders a red box of size 43x27 starting at (291, 182).
; PLAN: r0=291(x), r1=182(y), r2=43(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 182
LDI r2, 43
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
