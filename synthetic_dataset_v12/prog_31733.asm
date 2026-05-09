; DESCRIPTION: Places a orange 61x76 rectangle at position (12, 122).
; PLAN: r0=12(x), r1=122(y), r2=61(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 122
LDI r2, 61
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
