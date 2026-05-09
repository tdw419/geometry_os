; DESCRIPTION: Places a orange 116x49 rectangle at position (101, 123).
; PLAN: r0=101(x), r1=123(y), r2=116(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 123
LDI r2, 116
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
