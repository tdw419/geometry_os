; DESCRIPTION: Renders a red box of size 26x81 starting at (137, 87).
; PLAN: r0=137(x), r1=87(y), r2=26(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 87
LDI r2, 26
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
