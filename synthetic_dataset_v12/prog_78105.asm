; DESCRIPTION: Renders a red box of size 59x38 starting at (259, 110).
; PLAN: r0=259(x), r1=110(y), r2=59(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 110
LDI r2, 59
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
