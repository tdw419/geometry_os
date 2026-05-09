; DESCRIPTION: Renders a red box of size 40x17 starting at (0, 230).
; PLAN: r0=0(x), r1=230(y), r2=40(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 230
LDI r2, 40
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
