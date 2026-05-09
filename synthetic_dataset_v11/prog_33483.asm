; DESCRIPTION: Places a orange 67x114 rectangle at position (181, 128).
; PLAN: r0=181(x), r1=128(y), r2=67(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 128
LDI r2, 67
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
