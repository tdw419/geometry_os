; DESCRIPTION: Places a orange 50x84 rectangle at position (101, 76).
; PLAN: r0=101(x), r1=76(y), r2=50(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 76
LDI r2, 50
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
