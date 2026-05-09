; DESCRIPTION: Renders a red box of size 34x59 starting at (291, 6).
; PLAN: r0=291(x), r1=6(y), r2=34(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 6
LDI r2, 34
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
