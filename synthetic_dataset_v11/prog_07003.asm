; DESCRIPTION: Renders a red box of size 114x54 starting at (109, 99).
; PLAN: r0=109(x), r1=99(y), r2=114(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 99
LDI r2, 114
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
