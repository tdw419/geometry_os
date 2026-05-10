; DESCRIPTION: Renders a red box of size 46x87 starting at (194, 26).
; PLAN: r0=194(x), r1=26(y), r2=46(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 26
LDI r2, 46
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
