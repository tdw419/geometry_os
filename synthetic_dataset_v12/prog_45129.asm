; DESCRIPTION: Renders a red box of size 84x82 starting at (252, 18).
; PLAN: r0=252(x), r1=18(y), r2=84(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 18
LDI r2, 84
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
