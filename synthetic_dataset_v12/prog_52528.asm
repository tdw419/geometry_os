; DESCRIPTION: Places a orange 96x31 rectangle at position (375, 158).
; PLAN: r0=375(x), r1=158(y), r2=96(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 158
LDI r2, 96
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
