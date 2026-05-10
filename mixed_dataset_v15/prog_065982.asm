; DESCRIPTION: Places a orange 108x98 rectangle at position (82, 67).
; PLAN: r0=82(x), r1=67(y), r2=108(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 67
LDI r2, 108
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
