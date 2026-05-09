; DESCRIPTION: Places a black 41x30 rectangle at position (52, 68).
; PLAN: r0=52(x), r1=68(y), r2=41(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 68
LDI r2, 41
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
