; DESCRIPTION: Creates a cyan filled rectangle of size 62x29 starting at (121, 184).
; PLAN: r0=121(x), r1=184(y), r2=62(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 184
LDI r2, 62
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
