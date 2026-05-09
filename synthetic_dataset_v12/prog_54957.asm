; DESCRIPTION: Places a black 84x106 rectangle at position (396, 41).
; PLAN: r0=396(x), r1=41(y), r2=84(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 41
LDI r2, 84
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
