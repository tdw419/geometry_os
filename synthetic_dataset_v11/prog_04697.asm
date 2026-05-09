; DESCRIPTION: Renders a red box of size 33x21 starting at (17, 198).
; PLAN: r0=17(x), r1=198(y), r2=33(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 198
LDI r2, 33
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
