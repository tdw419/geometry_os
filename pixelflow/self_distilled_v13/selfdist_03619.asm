; DESCRIPTION: Creates a orange filled rectangle of size 41x69 starting at (286, 104).
; PLAN: r0=286(x), r1=104(y), r2=41(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 104
LDI r2, 41
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
