; DESCRIPTION: Renders a red box of size 17x14 starting at (203, 90).
; PLAN: r0=203(x), r1=90(y), r2=17(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 90
LDI r2, 17
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
