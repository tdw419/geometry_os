; DESCRIPTION: Places a orange 58x41 rectangle at position (358, 12).
; PLAN: r0=358(x), r1=12(y), r2=58(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 12
LDI r2, 58
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
