; DESCRIPTION: Renders a red box of size 99x105 starting at (10, 77).
; PLAN: r0=10(x), r1=77(y), r2=99(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 77
LDI r2, 99
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
