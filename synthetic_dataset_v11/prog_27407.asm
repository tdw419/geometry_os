; DESCRIPTION: Renders a yellow box of size 23x101 starting at (167, 129).
; PLAN: r0=167(x), r1=129(y), r2=23(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 129
LDI r2, 23
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
