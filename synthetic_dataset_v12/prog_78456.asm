; DESCRIPTION: Places a orange 67x39 rectangle at position (312, 90).
; PLAN: r0=312(x), r1=90(y), r2=67(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 90
LDI r2, 67
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
