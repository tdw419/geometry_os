; DESCRIPTION: Places a orange 50x96 rectangle at position (41, 44).
; PLAN: r0=41(x), r1=44(y), r2=50(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 44
LDI r2, 50
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
