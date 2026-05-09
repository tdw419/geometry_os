; DESCRIPTION: Renders a red box of size 84x54 starting at (17, 167).
; PLAN: r0=17(x), r1=167(y), r2=84(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 167
LDI r2, 84
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
