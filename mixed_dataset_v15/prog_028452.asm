; DESCRIPTION: Places a white 114x10 rectangle at position (41, 158).
; PLAN: r0=41(x), r1=158(y), r2=114(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 158
LDI r2, 114
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
