; DESCRIPTION: Places a orange 47x109 rectangle at position (103, 41).
; PLAN: r0=103(x), r1=41(y), r2=47(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 41
LDI r2, 47
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
