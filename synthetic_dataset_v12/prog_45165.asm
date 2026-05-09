; DESCRIPTION: Places a orange 41x47 rectangle at position (58, 203).
; PLAN: r0=58(x), r1=203(y), r2=41(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 203
LDI r2, 41
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
