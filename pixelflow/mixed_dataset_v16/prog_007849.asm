; DESCRIPTION: Renders a white box of size 32x12 starting at (390, 151).
; PLAN: r0=390(x), r1=151(y), r2=32(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 151
LDI r2, 32
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
