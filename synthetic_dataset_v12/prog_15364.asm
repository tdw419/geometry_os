; DESCRIPTION: Renders a red box of size 19x37 starting at (219, 56).
; PLAN: r0=219(x), r1=56(y), r2=19(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 56
LDI r2, 19
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
