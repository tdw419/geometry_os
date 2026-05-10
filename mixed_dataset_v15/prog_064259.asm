; DESCRIPTION: Renders a white box of size 19x101 starting at (137, 108).
; PLAN: r0=137(x), r1=108(y), r2=19(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 108
LDI r2, 19
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
