; DESCRIPTION: Renders a red box of size 77x109 starting at (59, 34).
; PLAN: r0=59(x), r1=34(y), r2=77(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 34
LDI r2, 77
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
