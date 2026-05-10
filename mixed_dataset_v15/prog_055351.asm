; DESCRIPTION: Renders a green box of size 55x23 starting at (68, 151).
; PLAN: r0=68(x), r1=151(y), r2=55(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 151
LDI r2, 55
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
