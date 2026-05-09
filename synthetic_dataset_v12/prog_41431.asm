; DESCRIPTION: Renders a red box of size 46x68 starting at (85, 101).
; PLAN: r0=85(x), r1=101(y), r2=46(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 101
LDI r2, 46
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
