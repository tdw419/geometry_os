; DESCRIPTION: Renders a red box of size 26x54 starting at (77, 106).
; PLAN: r0=77(x), r1=106(y), r2=26(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 106
LDI r2, 26
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
