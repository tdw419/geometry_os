; DESCRIPTION: Places a orange 82x67 rectangle at position (5, 176).
; PLAN: r0=5(x), r1=176(y), r2=82(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 176
LDI r2, 82
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
