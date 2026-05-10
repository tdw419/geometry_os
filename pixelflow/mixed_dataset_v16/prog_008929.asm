; DESCRIPTION: Renders a red box of size 13x78 starting at (12, 5).
; PLAN: r0=12(x), r1=5(y), r2=13(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 5
LDI r2, 13
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
