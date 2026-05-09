; DESCRIPTION: Places a black 34x119 rectangle at position (158, 122).
; PLAN: r0=158(x), r1=122(y), r2=34(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 122
LDI r2, 34
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
