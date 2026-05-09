; DESCRIPTION: Renders a red box of size 105x91 starting at (17, 48).
; PLAN: r0=17(x), r1=48(y), r2=105(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 48
LDI r2, 105
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
