; DESCRIPTION: Places a black 18x13 rectangle at position (49, 189).
; PLAN: r0=49(x), r1=189(y), r2=18(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 189
LDI r2, 18
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
