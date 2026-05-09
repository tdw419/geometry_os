; DESCRIPTION: Places a orange 82x76 rectangle at position (389, 122).
; PLAN: r0=389(x), r1=122(y), r2=82(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 122
LDI r2, 82
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
