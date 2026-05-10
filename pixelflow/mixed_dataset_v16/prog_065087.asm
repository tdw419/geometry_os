; DESCRIPTION: Places a black 110x108 rectangle at position (41, 126).
; PLAN: r0=41(x), r1=126(y), r2=110(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 126
LDI r2, 110
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
