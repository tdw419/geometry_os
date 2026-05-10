; DESCRIPTION: Creates a yellow filled rectangle of size 53x101 starting at (92, 20).
; PLAN: r0=92(x), r1=20(y), r2=53(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 20
LDI r2, 53
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
