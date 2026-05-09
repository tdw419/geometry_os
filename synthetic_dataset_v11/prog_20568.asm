; DESCRIPTION: Places a orange 53x78 rectangle at position (118, 173).
; PLAN: r0=118(x), r1=173(y), r2=53(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 173
LDI r2, 53
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
