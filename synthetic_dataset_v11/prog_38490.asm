; DESCRIPTION: Renders a red box of size 76x87 starting at (108, 122).
; PLAN: r0=108(x), r1=122(y), r2=76(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 122
LDI r2, 76
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
