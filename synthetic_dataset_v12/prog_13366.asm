; DESCRIPTION: Renders a green box of size 32x78 starting at (315, 151).
; PLAN: r0=315(x), r1=151(y), r2=32(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 151
LDI r2, 32
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
