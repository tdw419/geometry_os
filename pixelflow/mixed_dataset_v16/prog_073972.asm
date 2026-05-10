; DESCRIPTION: Places a orange 41x67 rectangle at position (429, 93).
; PLAN: r0=429(x), r1=93(y), r2=41(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 93
LDI r2, 41
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
