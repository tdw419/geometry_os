; DESCRIPTION: Renders a red box of size 26x112 starting at (43, 117).
; PLAN: r0=43(x), r1=117(y), r2=26(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 117
LDI r2, 26
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
