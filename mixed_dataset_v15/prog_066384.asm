; DESCRIPTION: Places a black 88x31 rectangle at position (49, 123).
; PLAN: r0=49(x), r1=123(y), r2=88(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 123
LDI r2, 88
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
