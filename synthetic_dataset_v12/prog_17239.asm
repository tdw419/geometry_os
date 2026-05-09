; DESCRIPTION: Renders a green box of size 69x101 starting at (43, 14).
; PLAN: r0=43(x), r1=14(y), r2=69(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 14
LDI r2, 69
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
