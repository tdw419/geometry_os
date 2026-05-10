; DESCRIPTION: Renders a red box of size 88x69 starting at (218, 12).
; PLAN: r0=218(x), r1=12(y), r2=88(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 12
LDI r2, 88
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
