; DESCRIPTION: Creates a yellow filled rectangle of size 64x84 starting at (11, 135).
; PLAN: r0=11(x), r1=135(y), r2=64(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 135
LDI r2, 64
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
