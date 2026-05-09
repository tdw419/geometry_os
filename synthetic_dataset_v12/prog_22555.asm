; DESCRIPTION: Places a orange 118x119 rectangle at position (32, 67).
; PLAN: r0=32(x), r1=67(y), r2=118(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 67
LDI r2, 118
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
