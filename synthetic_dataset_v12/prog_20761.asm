; DESCRIPTION: Renders a red box of size 59x13 starting at (252, 9).
; PLAN: r0=252(x), r1=9(y), r2=59(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 9
LDI r2, 59
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
