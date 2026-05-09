; DESCRIPTION: Places a orange 97x43 rectangle at position (8, 84).
; PLAN: r0=8(x), r1=84(y), r2=97(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 84
LDI r2, 97
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
