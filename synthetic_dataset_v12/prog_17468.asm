; DESCRIPTION: Renders a black box of size 69x42 starting at (192, 78).
; PLAN: r0=192(x), r1=78(y), r2=69(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 78
LDI r2, 69
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
