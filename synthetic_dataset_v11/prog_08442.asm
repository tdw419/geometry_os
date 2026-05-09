; DESCRIPTION: Places a orange 102x78 rectangle at position (134, 18).
; PLAN: r0=134(x), r1=18(y), r2=102(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 18
LDI r2, 102
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
