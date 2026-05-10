; DESCRIPTION: Creates a yellow filled rectangle of size 49x39 starting at (184, 184).
; PLAN: r0=184(x), r1=184(y), r2=49(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 184
LDI r2, 49
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
