; DESCRIPTION: Places a orange 68x61 rectangle at position (316, 41).
; PLAN: r0=316(x), r1=41(y), r2=68(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 41
LDI r2, 68
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
