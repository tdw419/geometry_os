; DESCRIPTION: Renders a yellow box of size 80x27 starting at (15, 151).
; PLAN: r0=15(x), r1=151(y), r2=80(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 151
LDI r2, 80
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
