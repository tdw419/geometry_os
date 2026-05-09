; DESCRIPTION: Renders a yellow box of size 23x11 starting at (187, 151).
; PLAN: r0=187(x), r1=151(y), r2=23(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 151
LDI r2, 23
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
