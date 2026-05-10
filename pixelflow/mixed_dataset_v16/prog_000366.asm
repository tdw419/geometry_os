; DESCRIPTION: Renders a red box of size 34x19 starting at (59, 184).
; PLAN: r0=59(x), r1=184(y), r2=34(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 184
LDI r2, 34
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
