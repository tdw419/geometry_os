; DESCRIPTION: Renders a cyan box of size 62x101 starting at (313, 69).
; PLAN: r0=313(x), r1=69(y), r2=62(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 69
LDI r2, 62
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
