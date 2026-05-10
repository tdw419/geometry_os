; DESCRIPTION: Renders a red box of size 19x105 starting at (131, 43).
; PLAN: r0=131(x), r1=43(y), r2=19(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 43
LDI r2, 19
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
