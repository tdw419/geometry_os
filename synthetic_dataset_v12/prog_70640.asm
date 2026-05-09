; DESCRIPTION: Renders a red box of size 11x17 starting at (291, 110).
; PLAN: r0=291(x), r1=110(y), r2=11(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 110
LDI r2, 11
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
