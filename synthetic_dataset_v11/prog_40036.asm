; DESCRIPTION: Renders a red box of size 99x114 starting at (143, 3).
; PLAN: r0=143(x), r1=3(y), r2=99(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 3
LDI r2, 99
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
