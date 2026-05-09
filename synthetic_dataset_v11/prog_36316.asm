; DESCRIPTION: Places a orange 25x10 rectangle at position (162, 122).
; PLAN: r0=162(x), r1=122(y), r2=25(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 122
LDI r2, 25
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
