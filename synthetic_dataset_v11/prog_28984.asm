; DESCRIPTION: Renders a red box of size 56x101 starting at (170, 18).
; PLAN: r0=170(x), r1=18(y), r2=56(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 18
LDI r2, 56
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
