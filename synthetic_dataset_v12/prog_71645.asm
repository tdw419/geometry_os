; DESCRIPTION: Places a orange 87x33 rectangle at position (101, 26).
; PLAN: r0=101(x), r1=26(y), r2=87(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 26
LDI r2, 87
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
