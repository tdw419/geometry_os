; DESCRIPTION: Renders a red box of size 65x76 starting at (43, 80).
; PLAN: r0=43(x), r1=80(y), r2=65(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 80
LDI r2, 65
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
