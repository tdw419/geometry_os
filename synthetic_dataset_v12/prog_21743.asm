; DESCRIPTION: Renders a red box of size 43x11 starting at (171, 2).
; PLAN: r0=171(x), r1=2(y), r2=43(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 2
LDI r2, 43
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
