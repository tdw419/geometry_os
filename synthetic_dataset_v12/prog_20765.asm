; DESCRIPTION: Renders a red box of size 65x105 starting at (184, 18).
; PLAN: r0=184(x), r1=18(y), r2=65(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 18
LDI r2, 65
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
