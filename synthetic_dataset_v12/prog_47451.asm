; DESCRIPTION: Renders a red box of size 11x46 starting at (99, 181).
; PLAN: r0=99(x), r1=181(y), r2=11(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 181
LDI r2, 11
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
