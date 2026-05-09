; DESCRIPTION: Renders a red box of size 28x101 starting at (99, 126).
; PLAN: r0=99(x), r1=126(y), r2=28(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 126
LDI r2, 28
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
