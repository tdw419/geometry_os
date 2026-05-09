; DESCRIPTION: Renders a blue box of size 61x36 starting at (16, 151).
; PLAN: r0=16(x), r1=151(y), r2=61(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 151
LDI r2, 61
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
