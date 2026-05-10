; DESCRIPTION: Creates a yellow filled rectangle of size 64x48 starting at (288, 121).
; PLAN: r0=288(x), r1=121(y), r2=64(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 121
LDI r2, 64
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
