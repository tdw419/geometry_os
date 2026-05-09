; DESCRIPTION: Places a black 115x36 rectangle at position (41, 211).
; PLAN: r0=41(x), r1=211(y), r2=115(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 211
LDI r2, 115
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
