; DESCRIPTION: Renders a red box of size 106x101 starting at (191, 60).
; PLAN: r0=191(x), r1=60(y), r2=106(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 60
LDI r2, 106
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
