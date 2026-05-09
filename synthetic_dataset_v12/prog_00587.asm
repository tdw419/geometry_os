; DESCRIPTION: Places a yellow 88x101 rectangle at position (227, 76).
; PLAN: r0=227(x), r1=76(y), r2=88(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 76
LDI r2, 88
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
