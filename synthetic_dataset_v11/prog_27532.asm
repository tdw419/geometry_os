; DESCRIPTION: Renders a blue box of size 117x100 starting at (27, 151).
; PLAN: r0=27(x), r1=151(y), r2=117(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 151
LDI r2, 117
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
