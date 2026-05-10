; DESCRIPTION: Places a orange 67x45 rectangle at position (31, 5).
; PLAN: r0=31(x), r1=5(y), r2=67(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 5
LDI r2, 67
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
