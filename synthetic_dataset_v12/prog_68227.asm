; DESCRIPTION: Renders a red box of size 88x36 starting at (285, 149).
; PLAN: r0=285(x), r1=149(y), r2=88(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 149
LDI r2, 88
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
