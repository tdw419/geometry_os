; DESCRIPTION: Places a orange 41x100 rectangle at position (382, 114).
; PLAN: r0=382(x), r1=114(y), r2=41(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 114
LDI r2, 41
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
