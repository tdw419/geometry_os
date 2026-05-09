; DESCRIPTION: Places a cyan 43x105 rectangle at position (134, 41).
; PLAN: r0=134(x), r1=41(y), r2=43(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 41
LDI r2, 43
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
