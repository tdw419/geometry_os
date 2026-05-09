; DESCRIPTION: Renders a red box of size 23x106 starting at (178, 123).
; PLAN: r0=178(x), r1=123(y), r2=23(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 123
LDI r2, 23
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
