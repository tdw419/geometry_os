; DESCRIPTION: Places a orange 46x13 rectangle at position (113, 11).
; PLAN: r0=113(x), r1=11(y), r2=46(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 11
LDI r2, 46
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
