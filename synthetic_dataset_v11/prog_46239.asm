; DESCRIPTION: Renders a red box of size 62x11 starting at (17, 21).
; PLAN: r0=17(x), r1=21(y), r2=62(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 21
LDI r2, 62
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
