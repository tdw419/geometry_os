; DESCRIPTION: Renders a black box of size 69x56 starting at (96, 149).
; PLAN: r0=96(x), r1=149(y), r2=69(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 149
LDI r2, 69
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
