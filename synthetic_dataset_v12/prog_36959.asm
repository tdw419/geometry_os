; DESCRIPTION: Places a black 88x76 rectangle at position (0, 72).
; PLAN: r0=0(x), r1=72(y), r2=88(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 72
LDI r2, 88
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
