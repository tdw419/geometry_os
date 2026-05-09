; DESCRIPTION: Places a orange 97x36 rectangle at position (19, 69).
; PLAN: r0=19(x), r1=69(y), r2=97(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 69
LDI r2, 97
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
