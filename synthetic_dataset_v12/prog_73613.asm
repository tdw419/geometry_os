; DESCRIPTION: Places a black 105x54 rectangle at position (286, 41).
; PLAN: r0=286(x), r1=41(y), r2=105(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 41
LDI r2, 105
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
