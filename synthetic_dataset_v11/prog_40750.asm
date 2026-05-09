; DESCRIPTION: Places a black 49x119 rectangle at position (133, 49).
; PLAN: r0=133(x), r1=49(y), r2=49(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 49
LDI r2, 49
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
