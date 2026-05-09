; DESCRIPTION: Places a black 58x93 rectangle at position (110, 41).
; PLAN: r0=110(x), r1=41(y), r2=58(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 41
LDI r2, 58
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
