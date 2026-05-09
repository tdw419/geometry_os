; DESCRIPTION: Places a red 39x41 rectangle at position (134, 26).
; PLAN: r0=134(x), r1=26(y), r2=39(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 26
LDI r2, 39
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
