; DESCRIPTION: Places a orange 90x11 rectangle at position (31, 161).
; PLAN: r0=31(x), r1=161(y), r2=90(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 161
LDI r2, 90
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
